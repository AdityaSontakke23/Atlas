import MapKit
import SwiftUI

final class MapCoordinator: NSObject, MKMapViewDelegate {
    var onAnnotationTapped: ((Landmark) -> Void)?
    var overlayAlpha: Double = 0.7

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        OverlayRendererFactory.makeRenderer(for: overlay, alpha: CGFloat(overlayAlpha))
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? LandmarkAnnotation else { return }
        onAnnotationTapped?(annotation.landmark)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is LandmarkAnnotation else { return nil }
        let identifier = "LandmarkPin"
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.annotation = annotation
        view.canShowCallout = true
        view.markerTintColor = .systemOrange
        return view
    }
}
