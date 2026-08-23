import UIKit

/// Loads files from the project's `content/` resource tree without using Xcode asset catalogs.
enum UIAssetLoader {
    static func image(named fileName: String) -> UIImage? {
        guard let root = Bundle.main.resourceURL else { return nil }
        let url = root
            .appendingPathComponent("content", isDirectory: true)
            .appendingPathComponent("textures", isDirectory: true)
            .appendingPathComponent("ui", isDirectory: true)
            .appendingPathComponent(fileName, isDirectory: false)
        return UIImage(contentsOfFile: url.path)
    }
}
