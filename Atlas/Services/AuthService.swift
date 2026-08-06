import Supabase
import Foundation
import Combine

@MainActor
final class AuthService: ObservableObject {
    private let client = SupabaseClientProvider.shared.client
    @Published var session: Session?
    @Published var isLoading = true

    init() {
        Task { await observeAuthChanges() }
    }

    func signUp(email: String, password: String) async throws {
        try await client.auth.signUp(email: email, password: password)
    }

    func signIn(email: String, password: String) async throws {
        try await client.auth.signIn(email: email, password: password)
    }

    func signOut() async throws {
        try await client.auth.signOut()
    }

    func handleDeepLink(url: URL) async throws {
        try await client.auth.session(from: url)
    }

    var currentUserId: UUID? {
        session?.user.id
    }

    private func observeAuthChanges() async {
        for await (_, session) in client.auth.authStateChanges {
            self.session = session
            self.isLoading = false
        }
    }
}
