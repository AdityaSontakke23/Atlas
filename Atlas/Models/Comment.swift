import Foundation

struct Comment: Codable, Identifiable, Hashable {
    let id: UUID
    let landmarkId: UUID
    let userId: UUID
    var body: String
    let createdAt: Date
    let updatedAt: Date
    var deletedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id, body
        case landmarkId = "landmark_id"
        case userId = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}
