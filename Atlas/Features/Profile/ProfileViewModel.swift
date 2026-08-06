import Foundation
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var profile: Profile?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let profileService = ProfileService()

    func loadProfile(userId: UUID?) async {
        guard let userId else { return }
        isLoading = true
        do {
            profile = try await profileService.fetchProfile(userId: userId)
        } catch {
            errorMessage = "Profile not found yet."
        }
        isLoading = false
    }
}