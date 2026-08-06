import Supabase
import Foundation

final class ProfileService {
    private let client = SupabaseClientProvider.shared.client

    func fetchProfile(userId: UUID) async throws -> Profile {
        try await client
            .from("profiles")
            .select()
            .eq("id", value: userId.uuidString)
            .single()
            .execute()
            .value
    }

    func upsertProfile(_ profile: Profile) async throws {
        try await client
            .from("profiles")
            .upsert(profile)
            .execute()
    }

    func uploadAvatar(userId: UUID, data: Data) async throws -> String {
        let path = "\(userId.uuidString)/profile.jpg"
        try await client.storage
            .from("avatars")
            .upload(
                path: path,
                file: data,
                options: FileOptions(contentType: "image/jpeg", upsert: true)
            )
        return path
    }
}
