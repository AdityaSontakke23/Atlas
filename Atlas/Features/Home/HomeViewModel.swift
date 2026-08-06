//
//  HomeViewModel.swift
//  Atlas
//
//  Created by Adison  on 04/08/26.
//


import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var featuredLandmarks: [Landmark] = []
    @Published var stories: [Story] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let landmarkService = LandmarkService()
    private let storyService = StoryService()

    func loadHome() async {
        isLoading = true
        errorMessage = nil
        do {
            async let landmarks = landmarkService.fetchFeaturedLandmarks()
            async let publishedStories = storyService.fetchPublishedStories()
            featuredLandmarks = try await landmarks
            stories = try await publishedStories
        } catch {
            errorMessage = "Couldn't load content. Pull to refresh."
        }
        isLoading = false
    }
}
