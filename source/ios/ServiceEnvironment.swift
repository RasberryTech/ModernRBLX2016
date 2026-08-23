import Foundation
import Combine

@MainActor
final class ServiceEnvironment: ObservableObject {
    @Published private(set) var mode: DataMode
    @Published private(set) var endpoint: String
    let service: RobloxService

    init() {
        let storedMode = UserDefaults.standard.string(forKey: "ModernRBLX2016.dataMode")
        let mode = DataMode(rawValue: storedMode ?? "mock") ?? .mock
        let endpoint = UserDefaults.standard.string(forKey: "ModernRBLX2016.endpoint") ?? "http://localhost:3000"
        self.mode = mode
        self.endpoint = endpoint
        self.service = RobloxService(mode: mode, baseURL: URL(string: endpoint) ?? URL(string: "http://localhost:3000")!)
    }

    func setMode(_ mode: DataMode) {
        self.mode = mode
        UserDefaults.standard.set(mode.rawValue, forKey: "ModernRBLX2016.dataMode")
        service.setMode(mode)
    }

    @discardableResult
    func setEndpoint(_ endpoint: String) -> Bool {
        guard service.setBaseURL(endpoint) else { return false }
        self.endpoint = endpoint.trimmingCharacters(in: .whitespacesAndNewlines)
        UserDefaults.standard.set(self.endpoint, forKey: "ModernRBLX2016.endpoint")
        return true
    }
}
