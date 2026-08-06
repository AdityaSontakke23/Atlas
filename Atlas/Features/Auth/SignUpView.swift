import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            if let error = viewModel.errorMessage {
                Text(error).foregroundStyle(.red).font(.footnote)
            }

            Button {
                Task { await viewModel.signUp() }
            } label: {
                if viewModel.isSubmitting {
                    ProgressView()
                } else {
                    Text("Sign Up").frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
