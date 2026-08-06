//
//  LandmarkAnnotationFactory.swift
//  Atlas
//
//  Created by Adison  on 30/07/26.
//

import Foundation

enum LandmarkAnnotationFactory {
    static func makeAnnotations(from landmarks: [Landmark]) -> [LandmarkAnnotation] {
        landmarks.map { LandmarkAnnotation(landmark: $0) }
    }
}
