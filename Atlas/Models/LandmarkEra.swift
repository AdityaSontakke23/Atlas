import Foundation

struct LandmarkEra: Codable, Identifiable, Hashable {
    let id: UUID
    let landmarkId: UUID
    var tileSetId: UUID?
    let eraLabel: String
    var yearStart: Int?
    var yearEnd: Int?
    var narrative: String?
    var shortFact: String?
    var coverImagePath: String?
    let sortOrder: Int
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, narrative
        case landmarkId = "landmark_id"
        case tileSetId = "tile_set_id"
        case eraLabel = "era_label"
        case yearStart = "year_start"
        case yearEnd = "year_end"
        case shortFact = "short_fact"
        case coverImagePath = "cover_image_path"
        case sortOrder = "sort_order"
        case createdAt = "created_at"
    }
}
