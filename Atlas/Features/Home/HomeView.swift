import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var router: AppRouter
    private let storage = StorageService()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    heroCard

                    if !viewModel.featuredLandmarks.isEmpty {
                        sectionHeader("Featured Landmarks")
                        landmarksCarousel
                    }

                    if !viewModel.stories.isEmpty {
                        sectionHeader("Stories")
                        storiesList
                    }

                    if viewModel.isLoading {
                        ProgressView().frame(maxWidth: .infinity).padding(.top, 40)
                    }

                    if let error = viewModel.errorMessage {
                        Text(error).foregroundStyle(.red).font(AtlasTheme.caption)
                    }
                }
                .padding(.vertical)
            }
            .atlasBackground()
            .navigationTitle("Atlas")
            .refreshable { await viewModel.loadHome() }
            .task { await viewModel.loadHome() }
        }
    }

    private var heroCard: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(colors: [AtlasTheme.accent.opacity(0.4), AtlasTheme.background],
                            startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                Text("South Mumbai").font(AtlasTheme.caption).foregroundStyle(AtlasTheme.accent)
                Text("Through Time").font(AtlasTheme.largeHeadline).foregroundStyle(.white)
            }
            .padding(24)
        }
        .padding(.horizontal)
        .transition(.opacity.combined(with: .scale(scale: 0.97)))
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(AtlasTheme.headline)
            .foregroundStyle(AtlasTheme.textPrimary)
            .padding(.horizontal)
    }

    private var landmarksCarousel: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(viewModel.featuredLandmarks) { landmark in
                    Button {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            router.openLandmark(slug: landmark.slug)
                        }
                    } label: {
                        LandmarkCard(landmark: landmark, storage: storage)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
    }

    private var storiesList: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.stories) { story in
                StoryRow(story: story)
            }
        }
        .padding(.horizontal)
    }
}

struct LandmarkCard: View {
    let landmark: Landmark
    let storage: StorageService

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(AtlasTheme.surface)
                .frame(width: 200, height: 130)
                .overlay(
                    Group {
                        if let path = landmark.heroImagePath,
                           let url = try? storage.publicURL(bucket: "era-photos", path: path) {
                            AsyncImage(url: url) { image in
                                image.resizable().aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        } else {
                            Image(systemName: "photo").foregroundStyle(AtlasTheme.textSecondary)
                        }
                    }
                )
                .clipped()

            Text(landmark.name).font(.subheadline.weight(.semibold)).foregroundStyle(AtlasTheme.textPrimary)
            if let subtitle = landmark.subtitle {
                Text(subtitle).font(AtlasTheme.caption).foregroundStyle(AtlasTheme.textSecondary).lineLimit(2)
            }
        }
        .frame(width: 200)
    }
}

struct StoryRow: View {
    let story: Story

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(story.title).font(.subheadline.weight(.semibold)).foregroundStyle(AtlasTheme.textPrimary)
            if let summary = story.summary {
                Text(summary).font(AtlasTheme.caption).foregroundStyle(AtlasTheme.textSecondary).lineLimit(2)
            }
        }
        .frostedCard()
    }
}