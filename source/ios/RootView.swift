import SwiftUI

struct RootView: View {
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
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

enum Screen: Hashable {
    case home, games, avatar, profile
}

#Preview {
    RootView()
}
