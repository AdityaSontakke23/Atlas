import Foundation
import Combine

@MainActor
final class LandmarkDetailViewModel: ObservableObject {
    @Published var eras: [LandmarkEra] = []
    @Published var comments: [Comment] = []
    @Published var newCommentText = ""
    @Published var isBookmarked = false
    @Published var isLoading = false

    let landmark: Landmark
    private let landmarkService = LandmarkService()
    private let commentService = CommentService()
    private let bookmarkService = BookmarkService()
    private let authService: AuthService

    init(landmark: Landmark, authService: AuthService) {
        self.landmark = landmark
        self.authService = authService
    }

    func loadDetail() async {
        isLoading = true
        do {
            async let e = landmarkService.fetchEras(landmarkId: landmark.id)
            async let c = commentService.fetchComments(landmarkId: landmark.id)
            eras = try await e
            comments = try await c
        } catch {
            eras = []
            comments = []
        }
        isLoading = false
    }

    func postComment() async {
        guard let userId = authService.currentUserId else { return }
        let trimmed = newCommentText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty, trimmed.count <= 500 else { return }
        do {
            let comment = try await commentService.postComment(landmarkId: landmark.id, userId: userId, body: trimmed)
            comments.append(comment)
            newCommentText = ""
        } catch {
            // Silently fail; RLS or network error — UI shows no new comment
        }
    }

    func toggleBookmark() async {
        guard let userId = authService.currentUserId else { return }
        do {
            if isBookmarked {
                try await bookmarkService.removeLandmarkBookmark(userId: userId, landmarkId: landmark.id)
            } else {
                try await bookmarkService.addLandmarkBookmark(userId: userId, landmarkId: landmark.id)
            }
            isBookmarked.toggle()
        } catch {
            // Ignore; state unchanged on failure
        }
    }
}