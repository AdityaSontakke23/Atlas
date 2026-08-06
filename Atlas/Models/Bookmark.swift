import Foundation

struct Bookmark: Codable, Identifiable, Hashable {
    let id: UUID
    let userId: UUID
    var landmarkId: UUID?
    var storyId: UUID?
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case landmarkId = "landmark_id"
        case storyId = "story_id"
        case createdAt = "created_at"
    }
}
