import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink("Home", value: Screen.home)
                NavigationLink("Games", value: Screen.games)
                NavigationLink("Avatar", value: Screen.avatar)
                NavigationLink("Profile", value: Screen.profile)
            }
            .navigationTitle("ROBLOX")
        } detail: {
            HomeView()
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
