import Supabase
import Foundation

final class CommentService {
    private let client = SupabaseClientProvider.shared.client

    func fetchComments(landmarkId: UUID) async throws -> [Comment] {
        try await client
            .from("comments")
            .select()
            .eq("landmark_id", value: landmarkId.uuidString)
            .is("deleted_at", value: nil)
            .order("created_at", ascending: true)
            .execute()
            .value
    }

    func postComment(landmarkId: UUID, userId: UUID, body: String) async throws -> Comment {
        let payload: [String: String] = [
            "landmark_id": landmarkId.uuidString,
            "user_id": userId.uuidString,
            "body": body
        ]
        return try await client
            .from("comments")
            .insert(payload)
            .select()
            .single()
            .execute()
            .value
    }

    func softDeleteComment(id: UUID) async throws {
        try await client
            .from("comments")
            .update(["deleted_at": ISO8601DateFormatter().string(from: Date())])
            .eq("id", value: id.uuidString)
            .execute()
    }
}
