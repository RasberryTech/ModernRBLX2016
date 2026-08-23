import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.18))
                        .frame(width: 56, height: 56)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome back")
                            .font(.headline)
                        Text("ModernRBLX2016")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()
                }

                Text("Featured")
                    .font(.title3.weight(.semibold))

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 12)], spacing: 12) {
                    FeatureCard(title: "Games", systemImage: "gamecontroller.fill")
                    FeatureCard(title: "Avatar", systemImage: "person.crop.circle.fill")
                    FeatureCard(title: "Profile", systemImage: "person.fill")
                    FeatureCard(title: "Settings", systemImage: "gearshape.fill")
                }
            }
            .padding(20)
        }
        .navigationTitle("Home")
        .background(Color(uiColor: .systemGroupedBackground))
    }
}

private struct FeatureCard: View {
    let title: String
    let systemImage: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: systemImage)
                .font(.title2)
            Text(title)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, minHeight: 110, alignment: .bottomLeading)
        .padding(14)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
