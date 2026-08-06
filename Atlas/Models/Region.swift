
import Foundation

struct Region: Codable, Identifiable, Hashable {
    let id: UUID
    let slug: String
    let name: String
    var summary: String?
    let defaultCenter: Coordinate
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, slug, name, summary
        case defaultCenter = "default_center"
        case createdAt = "created_at"
    }
}
