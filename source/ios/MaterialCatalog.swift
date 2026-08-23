import Foundation

/// Canonical 2016-era world-material names used by the renderer.
/// Paths intentionally point into the repository's `content/` tree.
enum Material2016: String, CaseIterable, Identifiable {
    case grass
    case plastic
    case brick
    case wood
    case concrete
    case metal
    case slate
    case sand
    case ice
    case glass

    var id: String { rawValue }

    /// Candidate texture locations are ordered from the most specific
    /// material resource to a generic fallback inside the 2016 content tree.
    var candidatePaths: [String] {
        [
            "content/textures/materials/\(rawValue).png",
            "content/textures/\(rawValue).png"
        ]
    }
}

struct MaterialManifestEntry: Codable, Equatable {
    let material: String
    let candidatePaths: [String]
}

struct MaterialManifest: Codable, Equatable {
    let source: String
    let era: String
    let entries: [MaterialManifestEntry]

    static let content2016 = MaterialManifest(
        source: "content/",
        era: "2016",
        entries: Material2016.allCases.map {
            MaterialManifestEntry(material: $0.rawValue, candidatePaths: $0.candidatePaths)
        }
    )
}
