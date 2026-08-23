import Foundation
import Combine

/// Eligibility state supplied by the project's supported account-service integration.
enum AccountEligibility: Equatable {
    case unknown
    case checking
    case eligible
    case ineligible(reason: String)
}

@MainActor
final class EligibilityController: ObservableObject {
    @Published private(set) var state: AccountEligibility = .unknown

    /// The live implementation must be backed by a supported Roblox account/service signal.
    /// This placeholder intentionally does not inspect identity documents or facial-age data.
    func evaluate(verified: Bool?) async {
        state = .checking
        guard let verified else {
            state = .unknown
            return
        }
        state = verified ? .eligible : .ineligible(reason: "This account is not eligible to use ModernRBLX2016.")
    }
}
