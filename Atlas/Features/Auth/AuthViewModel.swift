import Foundation
import Combine

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var isSubmitting = false

    private let authService: AuthService

    init(authService: AuthService) {
        self.authService = authService
    }

    func signIn() async {
        isSubmitting = true
        errorMessage = nil
        do {
            try await authService.signIn(email: email, password: password)
        } catch {
            errorMessage = error.localizedDescription
        }
        isSubmitting = false
    }

    func signUp() async {
        isSubmitting = true
        errorMessage = nil
        do {
            try await authService.signUp(email: email, password: password)
        } catch {
            errorMessage = error.localizedDescription
        }
        isSubmitting = false
    }
}
