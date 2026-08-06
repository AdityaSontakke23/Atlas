import Foundation

struct TileSet: Codable, Identifiable, Hashable {
    let id: UUID
    let regionId: UUID
    let label: String
    var yearStart: Int?
    var yearEnd: Int?
    let tileUrlTemplate: String
    let minZoom: Int
    let maxZoom: Int
    var boundsSw: Coordinate?
    var boundsNe: Coordinate?
    var attribution: String?
    var sourceName: String?
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, label, attribution
        case regionId = "region_id"
        case yearStart = "year_start"
        case yearEnd = "year_end"
        case tileUrlTemplate = "tile_url_template"
        case minZoom = "min_zoom"
        case maxZoom = "max_zoom"
        case boundsSw = "bounds_sw"
        case boundsNe = "bounds_ne"
        case sourceName = "source_name"
        case createdAt = "created_at"
    }
}
