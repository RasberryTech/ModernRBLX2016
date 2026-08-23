import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var environment: ServiceEnvironment

    var body: some View {
        Form {
            Section("Data source") {
                Picker("Environment", selection: Binding(
                    get: { environment.mode },
                    set: { environment.setMode($0) }
                )) {
                    Text("Live").tag(DataMode.live)
                    Text("Mock / Offline").tag(DataMode.mock)
                }
                .pickerStyle(.segmented)

                Text(environment.mode == .live
                     ? "Live mode uses the project compatibility service."
                     : "Mock mode keeps the UI usable without a network connection.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Section("Cache") {
                Button("Clear cached data") {
                    Task { await environment.service.clearCache() }
                }
            }

            Section("Diagnostics") {
                HStack {
                    Text("Status")
                    Spacer()
                    if environment.service.isLoading {
                        ProgressView()
                    } else {
                        Text("Ready")
                            .foregroundStyle(.secondary)
                    }
                }

                if let error = environment.service.lastError {
                    Text(error.localizedDescription)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
        .environmentObject(ServiceEnvironment())
}
