import Foundation

struct Profile: Codable, Identifiable, Hashable {
    let id: UUID
    var username: String?
    var displayName: String?
    var bio: String?
    var avatarPath: String?
    var hometown: String?
    var currentCity: String?
    var favoriteEra: String?
    let createdAt: Date
    let updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id, username, bio, hometown
        case displayName = "display_name"
        case avatarPath = "avatar_path"
        case currentCity = "current_city"
        case favoriteEra = "favorite_era"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
