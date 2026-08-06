import SwiftUI

struct AuthView: View {
    @EnvironmentObject var authService: AuthService
    @State private var showSignUp = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Atlas")
                    .font(.system(.largeTitle, design: .serif))
                Text("Explore places through time")
                    .foregroundStyle(.secondary)

                if showSignUp {
                    SignUpView(viewModel: AuthViewModel(authService: authService))
                } else {
                    SignInView(viewModel: AuthViewModel(authService: authService))
                }

                Button(showSignUp ? "Already have an account? Sign In" : "New here? Sign Up") {
                    showSignUp.toggle()
                }
                .font(.footnote)
            }
            .padding()
        }
    }
}
