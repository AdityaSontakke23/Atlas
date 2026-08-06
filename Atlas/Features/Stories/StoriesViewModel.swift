import Foundation
import Combine

@MainActor
final class StoriesViewModel: ObservableObject {
    @Published var stories: [Story] = []
    @Published var isLoading = false

    private let storyService = StoryService()

    func loadStories() async {
        isLoading = true
        stories = (try? await storyService.fetchPublishedStories()) ?? []
        isLoading = false
    }
}