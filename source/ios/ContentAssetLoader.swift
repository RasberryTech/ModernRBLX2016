import UIKit

/// Resolves 2016-era resources from the repository's `content/` tree.
enum ContentAssetLoader {
    static func url(relativePath: String) -> URL? {
        guard let root = Bundle.main.resourceURL else { return nil }
        return root.appendingPathComponent(relativePath, isDirectory: false)
    }

    static func image(relativePath: String) -> UIImage? {
        guard let url = url(relativePath: relativePath) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }

    static func uiImage(named fileName: String) -> UIImage? {
        image(relativePath: "content/textures/ui/\(fileName)")
    }

    static func materialImage(_ material: Material2016) -> UIImage? {
        for path in material.candidatePaths {
            if let image = image(relativePath: path) {
                return image
            }
        }
        return nil
    }
}
