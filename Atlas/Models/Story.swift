import Foundation

struct Story: Codable, Identifiable, Hashable {
    let id: UUID
    let slug: String
    let title: String
    var summary: String?
    let body: String
    var heroImagePath: String?
    var regionId: UUID?
    let isPublished: Bool
    let createdAt: Date
    let updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id, slug, title, summary, body
        case heroImagePath = "hero_image_path"
        case regionId = "region_id"
        case isPublished = "is_published"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
