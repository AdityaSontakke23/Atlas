import Supabase
import Foundation
import Combine

@MainActor
final class RealtimeService: ObservableObject {
    private let client = SupabaseClientProvider.shared.client
    private var channel: RealtimeChannelV2?

    @Published var onlineCount: Int = 0
    @Published var newComment: Comment?

    struct PresenceState: Codable {
        let userId: String
        let username: String
    }

    func joinRoom(roomSlug: String, userId: UUID, username: String) async {
        let channel = client.channel("room:\(roomSlug)")
        self.channel = channel

        let presenceChanges = channel.presenceChange()
        Task {
            for await presence in presenceChanges {
                let joins = try? presence.decodeJoins(as: PresenceState.self)
                self.onlineCount = joins?.count ?? self.onlineCount
            }
        }

        do {
            try await channel.subscribeWithError()
            try await channel.track(PresenceState(userId: userId.uuidString, username: username))
        } catch {
            print("Failed to join room \(roomSlug): \(error)")
        }
    }

    func leaveRoom() async {
        if let channel {
            await channel.untrack()
            await channel.unsubscribe()
        }
        channel = nil
        onlineCount = 0
    }
}
