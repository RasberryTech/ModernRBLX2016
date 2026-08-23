import Foundation
import Combine

@MainActor
final class ServiceEnvironment: ObservableObject {
    @Published private(set) var mode: DataMode
    let service: RobloxService

    init() {
        let stored = UserDefaults.standard.string(forKey: "ModernRBLX2016.dataMode")
        let mode = DataMode(rawValue: stored ?? "mock") ?? .mock
        self.mode = mode
        self.service = RobloxService(mode: mode)
    }

    func setMode(_ mode: DataMode) {
        self.mode = mode
        UserDefaults.standard.set(mode.rawValue, forKey: "ModernRBLX2016.dataMode")
        service.setMode(mode)
    }
}
