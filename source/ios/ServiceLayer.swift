import Foundation

struct RBLXUser: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let displayName: String
    let description: String?
}

struct RBLXGame: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let rootPlaceId: Int?
    let playing: Int?
    let visits: Int?
    let imageUrl: URL?
}

struct RBLXServer: Codable, Identifiable, Equatable {
    let id: String
    let maxPlayers: Int?
    let playing: Int?
    let ping: Int?
    let fps: Int?
}

struct RBLXThumbnail: Codable, Equatable {
    let targetId: Int
    let state: String?
    let imageUrl: URL?
}

enum DataMode: String, CaseIterable, Identifiable {
    case live
    case mock

    var id: String { rawValue }
}

enum ServiceError: LocalizedError, Equatable {
    case invalidURL
    case invalidResponse
    case httpStatus(Int)
    case decoding(String)
    case network(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The requested service URL is invalid."
        case .invalidResponse: return "The service returned an invalid response."
        case .httpStatus(let code): return "The service returned HTTP \(code)."
        case .decoding(let message): return "The response could not be decoded: \(message)"
        case .network(let message): return message
        }
    }
}

actor ResponseCache {
    private struct Entry {
        let data: Data
        let expiresAt: Date
    }

    private var entries: [String: Entry] = [:]

    func data(for key: String) -> Data? {
        guard let entry = entries[key] else { return nil }
        guard entry.expiresAt > Date() else {
            entries[key] = nil
            return nil
        }
        return entry.data
    }

    func insert(_ data: Data, for key: String, ttl: TimeInterval) {
        entries[key] = Entry(data: data, expiresAt: Date().addingTimeInterval(ttl))
    }

    func removeAll() {
        entries.removeAll()
    }
}

@MainActor
final class RobloxService: ObservableObject {
    @Published private(set) var mode: DataMode
    @Published private(set) var isLoading = false
    @Published private(set) var lastError: ServiceError?

    private let baseURL: URL
    private let session: URLSession
    private let cache = ResponseCache()

    init(mode: DataMode = .mock, baseURL: URL = URL(string: "http://localhost:3000")!, session: URLSession = .shared) {
        self.mode = mode
        self.baseURL = baseURL
        self.session = session
    }

    func setMode(_ mode: DataMode) {
        self.mode = mode
        lastError = nil
    }

    func clearCache() async {
        await cache.removeAll()
    }

    func user(id: Int) async -> Result<RBLXUser, ServiceError> {
        await perform(path: "/api/users/\(id)", cacheKey: "user:\(id)", ttl: 120, mock: MockData.user(id: id))
    }

    func game(universeId: Int) async -> Result<RBLXGame, ServiceError> {
        await perform(path: "/api/games/\(universeId)", cacheKey: "game:\(universeId)", ttl: 120, mock: MockData.game(universeId: universeId))
    }

    func servers(placeId: Int, limit: Int = 50) async -> Result<[RBLXServer], ServiceError> {
        let safeLimit = min(max(limit, 10), 100)
        return await perform(path: "/api/games/\(placeId)/servers?limit=\(safeLimit)", cacheKey: "servers:\(placeId):\(safeLimit)", ttl: 30, mock: MockData.servers(placeId: placeId))
    }

    func avatarThumbnail(userId: Int) async -> Result<RBLXThumbnail?, ServiceError> {
        await perform(path: "/api/thumbnails/users/\(userId)", cacheKey: "avatar:\(userId)", ttl: 300, mock: MockData.avatarThumbnail(userId: userId))
    }

    func gameThumbnail(universeId: Int) async -> Result<RBLXThumbnail?, ServiceError> {
        await perform(path: "/api/thumbnails/games/\(universeId)", cacheKey: "game-thumb:\(universeId)", ttl: 300, mock: MockData.gameThumbnail(universeId: universeId))
    }

    private func perform<T: Decodable>(path: String, cacheKey: String, ttl: TimeInterval, mock: T) async -> Result<T, ServiceError> {
        isLoading = true
        defer { isLoading = false }
        lastError = nil

        if mode == .mock {
            return .success(mock)
        }

        if let cached = await cache.data(for: cacheKey) {
            do {
                return .success(try JSONDecoder().decode(T.self, from: cached))
            } catch {
                // Ignore stale/corrupt cache and refresh from network.
            }
        }

        guard let url = URL(string: path, relativeTo: baseURL)?.absoluteURL else {
            let error: ServiceError = .invalidURL
            lastError = error
            return .failure(error)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        do {
            let (data, response) = try await session.data(for: request)
            guard let http = response as? HTTPURLResponse else {
                throw ServiceError.invalidResponse
            }
            guard (200..<300).contains(http.statusCode) else {
                throw ServiceError.httpStatus(http.statusCode)
            }

            let value: T
            do {
                value = try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw ServiceError.decoding(error.localizedDescription)
            }

            await cache.insert(data, for: cacheKey, ttl: ttl)
            return .success(value)
        } catch let error as ServiceError {
            lastError = error
            return .failure(error)
        } catch {
            let serviceError = ServiceError.network(error.localizedDescription)
            lastError = serviceError
            return .failure(serviceError)
        }
    }
}

enum MockData {
    static func user(id: Int) -> RBLXUser {
        RBLXUser(id: id, name: "Builder", displayName: "Builder", description: "Offline preview user")
    }

    static func game(universeId: Int) -> RBLXGame {
        RBLXGame(id: universeId, name: "Classic Roblox Experience", description: "Offline preview experience", rootPlaceId: universeId, playing: 128, visits: 2500000, imageUrl: nil)
    }

    static func servers(placeId: Int) -> [RBLXServer] {
        [
            RBLXServer(id: "mock-1", maxPlayers: 20, playing: 7, ping: 42, fps: 60),
            RBLXServer(id: "mock-2", maxPlayers: 20, playing: 15, ping: 68, fps: 60),
            RBLXServer(id: "mock-3", maxPlayers: 10, playing: 3, ping: 55, fps: 59)
        ]
    }

    static func avatarThumbnail(userId: Int) -> RBLXThumbnail? {
        RBLXThumbnail(targetId: userId, state: "Completed", imageUrl: nil)
    }

    static func gameThumbnail(universeId: Int) -> RBLXThumbnail? {
        RBLXThumbnail(targetId: universeId, state: "Completed", imageUrl: nil)
    }
}
