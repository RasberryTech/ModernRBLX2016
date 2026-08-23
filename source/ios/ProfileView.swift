import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var environment: ServiceEnvironment
    @State private var user: RBLXUser?
    @State private var isLoading = false
    @State private var errorMessage: String?

    private let demoUserID = 1

    var body: some View {
        List {
            Section("Profile") {
                if isLoading && user == nil {
                    ProgressView("Loading profile…")
                } else if let user {
                    Text(user.displayName).font(.title3.weight(.semibold))
                    Text("@\(user.name)").foregroundStyle(.secondary)
                    if let description = user.description, !description.isEmpty {
                        Text(description).font(.subheadline)
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
        .navigationTitle("Profile")
        .task { await load() }
        .refreshable { await load() }
    }

    private func load() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        switch await environment.service.user(id: demoUserID) {
        case .success(let value): user = value
        case .failure(let error): errorMessage = error.localizedDescription
        }
    }
}
