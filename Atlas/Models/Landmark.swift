import Foundation

struct Landmark: Codable, Identifiable, Hashable {
    let id: UUID
    let regionId: UUID
    let slug: String
    let name: String
    var subtitle: String?
    var summary: String?
    var presentDescription: String?
    var heroImagePath: String?
    let coordinate: Coordinate
    var tags: [String]
    var isFeatured: Bool
    let createdAt: Date
    let updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id, slug, name, subtitle, summary, coordinate, tags
        case regionId = "region_id"
        case presentDescription = "present_description"
        case heroImagePath = "hero_image_path"
        case isFeatured = "is_featured"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
