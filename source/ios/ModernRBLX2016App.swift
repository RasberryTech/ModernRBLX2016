import SwiftUI

@main
struct ModernRBLX2016App: App {
    @StateObject private var environment = ServiceEnvironment()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(environment)
        }
    }
}
