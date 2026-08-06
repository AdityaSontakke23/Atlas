import Foundation

enum ReactionType: String, Codable, CaseIterable {
    case surprised
    case beautiful
    case curious
    case wantToVisit = "want_to_visit"
}

struct Reaction: Codable, Identifiable, Hashable {
    let id: UUID
    let landmarkId: UUID
    let userId: UUID
    let reactionType: ReactionType
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case landmarkId = "landmark_id"
        case userId = "user_id"
        case reactionType = "reaction_type"
        case createdAt = "created_at"
    }
}
