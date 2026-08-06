import SwiftUI

struct LandmarkDetailView: View {
    @EnvironmentObject var authService: AuthService
    @StateObject private var viewModel: LandmarkDetailViewModel
    let landmark: Landmark

    init(landmark: Landmark) {
        self.landmark = landmark
        _viewModel = StateObject(wrappedValue: LandmarkDetailViewModel(landmark: landmark, authService: AuthService()))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header

                if let summary = landmark.summary {
                    Text(summary).font(AtlasTheme.body).foregroundStyle(AtlasTheme.textPrimary)
                }

                if !viewModel.eras.isEmpty {
                    timelineSection
                }

                commentsSection
            }
            .padding()
        }
        .atlasBackground()
        .task { await viewModel.loadDetail() }
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(landmark.name).font(AtlasTheme.headline).foregroundStyle(AtlasTheme.textPrimary)
                if let subtitle = landmark.subtitle {
                    Text(subtitle).font(AtlasTheme.caption).foregroundStyle(AtlasTheme.textSecondary)
                }
            }
            Spacer()
            Button {
                Task {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {}
                    await viewModel.toggleBookmark()
                }
            } label: {
                Image(systemName: viewModel.isBookmarked ? "bookmark.fill" : "bookmark")
                    .foregroundStyle(AtlasTheme.accent)
                    .font(.title3)
            }
        }
    }

    private var timelineSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Timeline").font(.subheadline.weight(.semibold)).foregroundStyle(AtlasTheme.textPrimary)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.eras) { era in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(era.eraLabel).font(.caption.weight(.semibold))
                            if let fact = era.shortFact {
                                Text(fact).font(.caption2).foregroundStyle(AtlasTheme.textSecondary).lineLimit(3)
                            }
                        }
                        .padding(12)
                        .frame(width: 160, alignment: .leading)
                        .frostedCard()
                    }
                }
            }
        }
    }

    private var commentsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Comments").font(.subheadline.weight(.semibold)).foregroundStyle(AtlasTheme.textPrimary)

            ForEach(viewModel.comments) { comment in
                Text(comment.body)
                    .font(AtlasTheme.caption)
                    .foregroundStyle(AtlasTheme.textPrimary)
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(AtlasTheme.surface)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            if authService.session != nil {
                HStack {
                    TextField("Add a comment", text: $viewModel.newCommentText)
                        .textFieldStyle(.roundedBorder)
                    Button("Post") {
                        Task { await viewModel.postComment() }
                    }
                    .disabled(viewModel.newCommentText.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}