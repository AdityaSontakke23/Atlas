//
//  LandmarkAnnotation.swift
//  Atlas
//
//  Created by Adison  on 04/08/26.
//


import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let landmark: Landmark

    var coordinate: CLLocationCoordinate2D { landmark.coordinate.clLocationCoordinate }
    var title: String? { landmark.name }
    var subtitle: String? { landmark.subtitle }

    init(landmark: Landmark) {
        self.landmark = landmark
    }
}