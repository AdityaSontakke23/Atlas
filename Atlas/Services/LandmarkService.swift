import Supabase
import Foundation

final class LandmarkService {
    private let client = SupabaseClientProvider.shared.client

    func fetchFeaturedLandmarks() async throws -> [Landmark] {
        try await client
            .from("landmarks")
            .select()
            .eq("is_featured", value: true)
            .execute()
            .value
    }

    func fetchLandmark(slug: String) async throws -> Landmark {
        try await client
            .from("landmarks")
            .select()
            .eq("slug", value: slug)
            .single()
            .execute()
            .value
    }

    func fetchLandmarksForRegion(regionId: UUID) async throws -> [Landmark] {
        try await client
            .from("landmarks")
            .select()
            .eq("region_id", value: regionId.uuidString)
            .execute()
            .value
    }

    func fetchNearby(lat: Double, lng: Double, radiusMeters: Int = 1500) async throws -> [Landmark] {
        try await client
            .rpc("get_nearby_landmarks", params: [
                "in_lat": AnyJSON(lat),
                "in_lng": AnyJSON(lng),
                "in_radius_meters": AnyJSON(radiusMeters)
            ])
            .execute()
            .value
    }

    func fetchEras(landmarkId: UUID) async throws -> [LandmarkEra] {
        try await client
            .from("landmark_eras")
            .select()
            .eq("landmark_id", value: landmarkId.uuidString)
            .order("sort_order", ascending: true)
            .execute()
            .value
    }

    func fetchEraPhotos(eraId: UUID) async throws -> [EraPhoto] {
        try await client
            .from("era_photos")
            .select()
            .eq("era_id", value: eraId.uuidString)
            .order("sort_order", ascending: true)
            .execute()
            .value
    }
}
