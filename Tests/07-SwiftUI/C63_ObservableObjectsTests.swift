import Combine
import Observation
import Synchronization
import Testing
@testable import Challenges

@Suite("C63 · Announcing Changes to SwiftUI")
struct C63_ObservableObjectsTests {
    @Test func scoreBoardLogic() {
        let board = ScoreBoard()
        board.add(points: 150)
        board.add(points: 75)
        #expect(board.score == 225)
        #expect(board.history == [150, 75])
        #expect(board.level == 3)
    }

    @Test func scoreBoardPublishesChanges() throws {
        let board = ScoreBoard()
        let publisher = try #require(
            (board as Any as? any ObservableObject)?.objectWillChange as? ObservableObjectPublisher,
            "ScoreBoard must conform to ObservableObject"
        )

        var changeCount = 0
        let cancellable = publisher.sink { changeCount += 1 }
        board.add(points: 10) // score + history → 2 announcements
        board.score = 0
        cancellable.cancel()

        #expect(changeCount == 3)
    }

    @Test func playlistLogic() {
        let playlist = Playlist()
        playlist.add("Anti-Hero")
        playlist.add("Cruel Summer")
        #expect(playlist.totalCount == 2)
    }

    @Test func playlistIsObservable() {
        let playlist = Playlist()
        let changed = Mutex(false)

        withObservationTracking {
            _ = playlist.songs
        } onChange: {
            changed.withLock { $0 = true }
        }

        playlist.add("Karma")
        #expect(changed.withLock { $0 }, "Playlist must be @Observable")
    }
}
