import Supabase
import Foundation

final class ReactionService {
    private let client = SupabaseClientProvider.shared.client

    func fetchReactions(landmarkId: UUID) async throws -> [Reaction] {
        try await client
            .from("reactions")
            .select()
            .eq("landmark_id", value: landmarkId.uuidString)
            .execute()
            .value
    }

    func addReaction(landmarkId: UUID, userId: UUID, type: ReactionType) async throws {
        let payload: [String: String] = [
            "landmark_id": landmarkId.uuidString,
            "user_id": userId.uuidString,
            "reaction_type": type.rawValue
        ]
        try await client.from("reactions").insert(payload).execute()
    }

    func removeReaction(landmarkId: UUID, userId: UUID, type: ReactionType) async throws {
        try await client
            .from("reactions")
            .delete()
            .eq("landmark_id", value: landmarkId.uuidString)
            .eq("user_id", value: userId.uuidString)
            .eq("reaction_type", value: type.rawValue)
            .execute()
    }
}
