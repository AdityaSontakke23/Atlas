import Foundation
import Combine

enum AppTab: Hashable {
    case home, explore, stories, community, profile
}

@MainActor
final class AppRouter: ObservableObject {
    @Published var selectedTab: AppTab = .home
    @Published var presentedLandmarkSlug: String?

    func openLandmark(slug: String) {
        presentedLandmarkSlug = slug
    }

    func dismissLandmark() {
        presentedLandmarkSlug = nil
    }
}
