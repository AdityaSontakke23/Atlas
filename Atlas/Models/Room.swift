import Foundation

struct Room: Codable, Identifiable, Hashable {
    let id: UUID
    let slug: String
    var landmarkId: UUID?
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, slug
        case landmarkId = "landmark_id"
        case createdAt = "created_at"
    }
}

struct RoomMember: Codable, Hashable {
    let roomId: UUID
    let userId: UUID
    let joinedAt: Date

    enum CodingKeys: String, CodingKey {
        case roomId = "room_id"
        case userId = "user_id"
        case joinedAt = "joined_at"
    }
}
