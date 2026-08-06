import Supabase
import Foundation

final class StoryService {
    private let client = SupabaseClientProvider.shared.client

    func fetchPublishedStories() async throws -> [Story] {
        try await client
            .from("stories")
            .select()
            .eq("is_published", value: true)
            .execute()
            .value
    }

    func fetchStory(slug: String) async throws -> Story {
        try await client
            .from("stories")
            .select()
            .eq("slug", value: slug)
            .single()
            .execute()
            .value
    }

    func fetchLandmarkIds(storyId: UUID) async throws -> [UUID] {
        struct Row: Decodable { let landmark_id: UUID }
        let rows: [Row] = try await client
            .from("story_landmarks")
            .select("landmark_id")
            .eq("story_id", value: storyId.uuidString)
            .execute()
            .value
        return rows.map { $0.landmark_id }
    }
}
