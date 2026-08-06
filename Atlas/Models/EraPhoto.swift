import Foundation

struct EraPhoto: Codable, Identifiable, Hashable {
    let id: UUID
    let eraId: UUID
    let storagePath: String
    var caption: String?
    var sourceCredit: String?
    var licenseNote: String?
    var yearTaken: Int?
    let sortOrder: Int
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, caption
        case eraId = "era_id"
        case storagePath = "storage_path"
        case sourceCredit = "source_credit"
        case licenseNote = "license_note"
        case yearTaken = "year_taken"
        case sortOrder = "sort_order"
        case createdAt = "created_at"
    }
}
