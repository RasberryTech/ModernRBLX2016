import SwiftUI

struct PlaceholderView: View {
    let title: String

    var body: some View {
        ContentUnavailableView(
            title,
            systemImage: "hourglass",
            description: Text("This 2016-style screen is ready for compatibility-layer wiring.")
        )
        .navigationTitle(title)
    }
}
