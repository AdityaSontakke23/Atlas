
import SwiftUI
import MapKit

struct MapKitBridgeView: UIViewRepresentable {
    @ObservedObject var store: MapStateStore
    var landmarks: [Landmark]
    var onSelectLandmark: (Landmark) -> Void

    func makeCoordinator() -> MapCoordinator {
        let coordinator = MapCoordinator()
        coordinator.onAnnotationTapped = onSelectLandmark
        return coordinator
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(store.region, animated: false)
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        context.coordinator.overlayAlpha = store.overlayAlpha

        let existingIds = Set(mapView.annotations.compactMap { ($0 as? LandmarkAnnotation)?.landmark.id })
        let newIds = Set(landmarks.map { $0.id })

        if existingIds != newIds {
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations(LandmarkAnnotationFactory.makeAnnotations(from: landmarks))
        }

        mapView.overlays.forEach { mapView.removeOverlay($0) }
        if let tileSet = store.activeTileSet {
            mapView.addOverlay(HistoricalTileOverlay(tileSet: tileSet), level: .aboveRoads)
        }
    }
}
