import SwiftUI

struct CommunityView: View {
    @EnvironmentObject var authService: AuthService
    @StateObject private var viewModel = CommunityViewModel()

    var body: some View {
        NavigationStack {
            List {
                Section("Saved Places") {
                    if viewModel.bookmarks.isEmpty {
                        Text("No saved places yet").foregroundStyle(AtlasTheme.textSecondary)
                    } else {
                        ForEach(viewModel.bookmarks, id: \.id) { bookmark in
                            Text(bookmark.landmarkId?.uuidString.prefix(8).description ?? "Story bookmark")
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .atlasBackground()
            .navigationTitle("Community")
            .task { await viewModel.loadCommunity(userId: authService.currentUserId) }
        }
    }
}