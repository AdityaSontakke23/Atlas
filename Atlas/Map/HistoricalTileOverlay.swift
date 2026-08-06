import MapKit

final class HistoricalTileOverlay: MKTileOverlay {
    let tileSetId: UUID
    private let customBoundingRect: MKMapRect?

    init(tileSet: TileSet) {
        self.tileSetId = tileSet.id

        if let sw = tileSet.boundsSw, let ne = tileSet.boundsNe {
            let swPoint = MKMapPoint(sw.clLocationCoordinate)
            let nePoint = MKMapPoint(ne.clLocationCoordinate)
            self.customBoundingRect = MKMapRect(
                x: min(swPoint.x, nePoint.x),
                y: min(swPoint.y, nePoint.y),
                width: abs(nePoint.x - swPoint.x),
                height: abs(nePoint.y - swPoint.y)
            )
        } else {
            self.customBoundingRect = nil
        }

        super.init(urlTemplate: tileSet.tileUrlTemplate)
        self.minimumZ = tileSet.minZoom
        self.maximumZ = tileSet.maxZoom
        self.canReplaceMapContent = false
    }

    override var boundingMapRect: MKMapRect {
        customBoundingRect ?? super.boundingMapRect
    }
}
