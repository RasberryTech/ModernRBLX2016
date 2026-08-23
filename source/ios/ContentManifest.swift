import Foundation

struct ContentManifest: Codable, Equatable {
    let era: String
    let root: String
    let uiRoot: String
    let worldRoot: String
    let categories: [String]

    static let roblox2016 = ContentManifest(
        era: "2016",
        root: "content",
        uiRoot: "content/textures/ui",
        worldRoot: "content/textures",
        categories: [
            "fonts", "internal", "music", "particles", "places",
            "scripts", "sky", "sounds", "textures"
        ]
    )
}
