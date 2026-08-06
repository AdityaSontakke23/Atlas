import Foundation
import CoreLocation

struct Coordinate: Codable, Hashable {
    let latitude: Double
    let longitude: Double

    var clLocationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    enum CodingKeys: String, CodingKey {
        case type, coordinates
    }

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let coords = try container.decode([Double].self, forKey: .coordinates)
        self.longitude = coords[0]
        self.latitude = coords[1]
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("Point", forKey: .type)
        try container.encode([longitude, latitude], forKey: .coordinates)
    }
}