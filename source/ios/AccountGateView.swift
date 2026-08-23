import SwiftUI

struct AccountGateView: View {
    @ObservedObject var eligibility: EligibilityController

    var body: some View {
        Group {
            switch eligibility.state {
            case .eligible:
                ContentView()
            case .ineligible(let reason):
                VStack(spacing: 14) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 44))
                    Text("Account Not Eligible")
                        .font(.title2.weight(.semibold))
                    Text(reason)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                }
                .padding(28)
            case .checking:
                ProgressView("Checking account eligibility…")
            case .unknown:
                VStack(spacing: 14) {
                    Text("Account eligibility is required")
                        .font(.title3.weight(.semibold))
                    Text("Sign in through a supported Roblox account flow before using the app.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                }
                .padding(28)
            }
        }
    }
}

private struct ContentView: View {
    var body: some View {
        RootView()
    }
}
