
import Foundation
import MapKit
import Combine

@MainActor
final class MapStateStore: ObservableObject {
    @Published var region: MKCoordinateRegion
    @Published var selectedLandmark: Landmark?
    @Published var activeTileSet: TileSet?
    @Published var overlayAlpha: Double = 0.7

    init(initialRegion: MKCoordinateRegion) {
        self.region = initialRegion
    }

    func selectLandmark(_ landmark: Landmark) {
        selectedLandmark = landmark
    }

    func clearSelection() {
        selectedLandmark = nil
        activeTileSet = nil
    }
}
