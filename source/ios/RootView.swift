import SwiftUI

struct RootView: View {
    @EnvironmentObject private var environment: ServiceEnvironment
    @State private var selection: Screen? = .home

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                Label("Home", systemImage: "house.fill")
                    .tag(Screen.home)
                Label("Games", systemImage: "gamecontroller.fill")
                    .tag(Screen.games)
                Label("Avatar", systemImage: "person.crop.circle.fill")
                    .tag(Screen.avatar)
                Label("Profile", systemImage: "person.fill")
                    .tag(Screen.profile)
                Label("Settings", systemImage: "gearshape.fill")
                    .tag(Screen.settings)
            }
            .navigationTitle("ROBLOX")
        } detail: {
            switch selection ?? .home {
            case .home:
                HomeView()
            case .games:
                PlaceholderView(title: "Games")
            case .avatar:
                PlaceholderView(title: "Avatar")
            case .profile:
                PlaceholderView(title: "Profile")
            case .settings:
                SettingsView()
            }
        }
        .navigationSplitViewStyle(.balanced)
        .overlay {
            if environment.service.isLoading {
                ProgressView()
                    .padding(12)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .alert("Connection error", isPresented: Binding(
            get: { environment.service.lastError != nil },
            set: { newValue in if !newValue { environment.service.setMode(environment.mode) } }
        )) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(environment.service.lastError?.localizedDescription ?? "Unknown service error")
        }
    }
}

enum Screen: Hashable {
    case home, games, avatar, profile, settings
}

#Preview {
    RootView()
        .environmentObject(ServiceEnvironment())
}
