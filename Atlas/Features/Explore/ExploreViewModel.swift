//
//  ExploreViewModel.swift
//  Atlas
//
//  Created by Adison  on 04/08/26.
//


import Foundation
import MapKit
import Combine

@MainActor
final class ExploreViewModel: ObservableObject {
    @Published var landmarks: [Landmark] = []
    @Published var eras: [LandmarkEra] = []
    @Published var selectedEraIndex: Int = 0
    @Published var isLoading = false

    let mapState: MapStateStore
    private let landmarkService = LandmarkService()
    private let regionService = RegionService()

    init() {
        let southMumbai = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 18.9388, longitude: 72.8311),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        self.mapState = MapStateStore(initialRegion: southMumbai)
    }

    func loadLandmarks() async {
        isLoading = true
        do {
            let region = try await regionService.fetchRegion(slug: "south-mumbai")
            landmarks = try await landmarkService.fetchLandmarksForRegion(regionId: region.id)
        } catch {
            landmarks = []
        }
        isLoading = false
    }

    func selectLandmark(_ landmark: Landmark) async {
        mapState.selectLandmark(landmark)
        do {
            eras = try await landmarkService.fetchEras(landmarkId: landmark.id)
            selectedEraIndex = 0
        } catch {
            eras = []
        }
    }
}
