
import MapKit

enum OverlayRendererFactory {
    static func makeRenderer(for overlay: MKOverlay, alpha: CGFloat) -> MKOverlayRenderer {
        if let tileOverlay = overlay as? HistoricalTileOverlay {
            let renderer = MKTileOverlayRenderer(tileOverlay: tileOverlay)
            renderer.alpha = alpha
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
