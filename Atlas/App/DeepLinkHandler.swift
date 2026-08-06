
import Foundation

enum DeepLinkHandler {
    static func handle(url: URL, router: AppRouter) {
        guard url.scheme == "atlas" else { return }

        if url.host == "landmark", let slug = url.pathComponents.dropFirst().first {
            router.openLandmark(slug: slug)
        } else if url.host == "auth" {
            // Auth callback is handled separately by AuthService.session(from:)
            return
        }
    }
}
