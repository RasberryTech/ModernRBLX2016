import SwiftUI

@main
struct ModernRBLX2016App: App {
    @StateObject private var environment = ServiceEnvironment()
    @StateObject private var eligibility = EligibilityController()

    var body: some Scene {
        WindowGroup {
            AccountGateView(eligibility: eligibility)
                .environmentObject(environment)
                .task {
                    await eligibility.evaluate(verified: environment.mode == .mock ? true : nil)
                }
        }
    }
}
