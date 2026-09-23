import Testing
@testable import Challenges

@Suite("C19 · Key Paths")
struct C19_KeyPathsTests {
    let songs = [
        Song(title: "Shake It Off", artist: "Taylor", plays: 300),
        Song(title: "Anti-Hero", artist: "Taylor", plays: 500),
        Song(title: "Bad Guy", artist: "Billie", plays: 100),
    ]

    @Test func sortsByAnyProperty() {
        #expect(songs.sorted(on: \.plays).pluck(\.title) == ["Bad Guy", "Shake It Off", "Anti-Hero"])
        #expect(songs.sorted(on: \.title, ascending: false).pluck(\.title) == ["Shake It Off", "Bad Guy", "Anti-Hero"])
    }

    @Test func plucking() {
        #expect(songs.pluck(\.artist) == ["Taylor", "Taylor", "Billie"])
    }

    @Test func summing() {
        #expect(sum(of: \.plays, in: songs) == 900)
        #expect(sum(of: \.count, in: ["ab", "cde"]) == 5)
    }
}
