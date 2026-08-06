import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            MapKitBridgeView(
                store: viewModel.mapState,
                landmarks: viewModel.landmarks,
                onSelectLandmark: { landmark in
                    Task { await viewModel.selectLandmark(landmark) }
                }
            )
            .ignoresSafeArea()

            VStack(spacing: 12) {
                searchBar
                if !viewModel.eras.isEmpty {
                    eraSelector
                }
            }
            .padding(.top, 8)
        }
        .sheet(item: $viewModel.mapState.selectedLandmark) { landmark in
            LandmarkDetailView(landmark: landmark)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .task { await viewModel.loadLandmarks() }
    }

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundStyle(AtlasTheme.textSecondary)
            Text("Search landmarks").foregroundStyle(AtlasTheme.textSecondary)
            Spacer()
        }
        .padding(12)
        .frostedCard()
        .padding(.horizontal)
    }

    private var eraSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(Array(viewModel.eras.enumerated()), id: \.element.id) { index, era in
                    Text(era.eraLabel)
                        .font(.caption.weight(.medium))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(
                            Capsule().fill(index == viewModel.selectedEraIndex ? AtlasTheme.accent : Color.white.opacity(0.1))
                        )
                        .foregroundStyle(index == viewModel.selectedEraIndex ? .black : .white)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                viewModel.selectedEraIndex = index
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

extension Landmark: Identifiable {}