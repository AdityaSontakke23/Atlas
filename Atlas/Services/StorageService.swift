import Supabase
import Foundation

final class StorageService {
    private let client = SupabaseClientProvider.shared.client

    func publicURL(bucket: String, path: String) throws -> URL {
        try client.storage.from(bucket).getPublicURL(path: path)
    }

    func uploadEraPhoto(eraId: UUID, fileName: String, data: Data) async throws -> String {
        let path = "\(eraId.uuidString)/\(fileName)"
        try await client.storage
            .from("era-photos")
            .upload(path, data: data, options: FileOptions(contentType: "image/jpeg", upsert: true))
        return path
    }
    
    func avatarSignedURL(path: String) async throws -> URL {
        try await client.storage.from("avatars").createSignedURL(path: path, expiresIn: 3600)
    }
}
