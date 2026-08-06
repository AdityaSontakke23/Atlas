import Supabase
import Foundation

final class BookmarkService {
    private let client = SupabaseClientProvider.shared.client

    func fetchBookmarks(userId: UUID) async throws -> [Bookmark] {
        try await client
            .from("bookmarks")
            .select()
            .eq("user_id", value: userId.uuidString)
            .execute()
            .value
    }

    func addLandmarkBookmark(userId: UUID, landmarkId: UUID) async throws {
        let payload: [String: String] = [
            "user_id": userId.uuidString,
            "landmark_id": landmarkId.uuidString
        ]
        try await client.from("bookmarks").insert(payload).execute()
    }

    func removeLandmarkBookmark(userId: UUID, landmarkId: UUID) async throws {
        try await client
            .from("bookmarks")
            .delete()
            .eq("user_id", value: userId.uuidString)
            .eq("landmark_id", value: landmarkId.uuidString)
            .execute()
    }
}
