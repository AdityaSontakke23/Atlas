//
//  StoriesView.swift
//  Atlas
//
//  Created by Adison  on 04/08/26.
//


import SwiftUI

struct StoriesView: View {
    @StateObject private var viewModel = StoriesViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.stories) { story in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(story.title).font(AtlasTheme.headline).foregroundStyle(AtlasTheme.textPrimary)
                            if let summary = story.summary {
                                Text(summary).font(AtlasTheme.body).foregroundStyle(AtlasTheme.textSecondary)
                            }
                        }
                        .frostedCard()
                        .transition(.opacity)
                    }
                }
                .padding()
            }
            .atlasBackground()
            .navigationTitle("Stories")
            .refreshable { await viewModel.loadStories() }
            .task { await viewModel.loadStories() }
        }
    }
}
