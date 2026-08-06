import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authService: AuthService
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(AtlasTheme.accent)

                if let profile = viewModel.profile {
                    Text(profile.displayName ?? profile.username ?? "Explorer")
                        .font(AtlasTheme.headline)
                        .foregroundStyle(AtlasTheme.textPrimary)
                } else if viewModel.isLoading {
                    ProgressView()
                }

                Spacer()

                Button("Sign Out", role: .destructive) {
                    Task { try? await authService.signOut() }
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .atlasBackground()
            .navigationTitle("Profile")
            .task { await viewModel.loadProfile(userId: authService.currentUserId) }
        }
    }
}