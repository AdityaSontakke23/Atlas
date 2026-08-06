//
//  CommunityViewModel.swift
//  Atlas
//
//  Created by Adison  on 04/08/26.
//


import Foundation
import Combine

@MainActor
final class CommunityViewModel: ObservableObject {
    @Published var bookmarks: [Bookmark] = []
    @Published var isLoading = false

    private let bookmarkService = BookmarkService()

    func loadCommunity(userId: UUID?) async {
        guard let userId else { return }
        isLoading = true
        bookmarks = (try? await bookmarkService.fetchBookmarks(userId: userId)) ?? []
        isLoading = false
    }
}
