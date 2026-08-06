import Supabase
import Foundation

final class RegionService {
    private let client = SupabaseClientProvider.shared.client

    func fetchRegion(slug: String) async throws -> Region {
        try await client
            .from("regions")
            .select()
            .eq("slug", value: slug)
            .single()
            .execute()
            .value
    }

    func fetchAllRegions() async throws -> [Region] {
        try await client
            .from("regions")
            .select()
            .execute()
            .value
    }
}
