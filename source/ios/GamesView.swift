import SwiftUI

struct GamesView: View {
    @EnvironmentObject private var environment: ServiceEnvironment
    @State private var game: RBLXGame?
    @State private var servers: [RBLXServer] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showGameUI = false

    private let demoUniverseID = 1818

    var body: some View {
        List {
            Section("Experience") {
                if isLoading && game == nil {
                    ProgressView("Loading game…")
                } else if let game {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(game.name).font(.headline)
                        if let description = game.description {
                            Text(description).font(.subheadline).foregroundStyle(.secondary)
                        }
                        if let playing = game.playing {
                            Text("Playing: \(playing)").font(.footnote).foregroundStyle(.secondary)
                        }

                        Button {
                            showGameUI = true
                        } label: {
                            Label("Open 2016 Game UI", systemImage: "play.fill")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }

            Section("Public Servers") {
                if isLoading && servers.isEmpty {
                    ProgressView("Loading servers…")
                } else if servers.isEmpty {
                    Text("No servers available.").foregroundStyle(.secondary)
                } else {
                    ForEach(servers) { server in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Server \(server.id)").font(.subheadline.weight(.semibold))
                                Text("Players: \(server.playing ?? 0)/\(server.maxPlayers ?? 0)")
                                    .font(.footnote).foregroundStyle(.secondary)
                            }
                            Spacer()
                            if let ping = server.ping {
                                Text("\(ping) ms").font(.footnote).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }

            if let errorMessage {
                Section {
                    Label(errorMessage, systemImage: "exclamationmark.triangle")
                        .foregroundStyle(.red)
                }
            }
        }
        .navigationTitle("Games")
        .task { await load() }
        .refreshable { await load() }
        .fullScreenCover(isPresented: $showGameUI) {
            if let game {
                Game2016View(
                    universeId: game.id,
                    placeId: game.rootPlaceId ?? game.id
                )
                .environmentObject(environment)
            }
        }
    }

    private func load() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        let gameResult = await environment.service.game(universeId: demoUniverseID)
        switch gameResult {
        case .success(let value): game = value
        case .failure(let error): errorMessage = error.localizedDescription
        }

        if let placeID = game?.rootPlaceId {
            let result = await environment.service.servers(placeId: placeID)
            switch result {
            case .success(let value): servers = value
            case .failure(let error): errorMessage = error.localizedDescription
            }
        }
    }
}
