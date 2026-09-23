// Solution · Challenge 63 · Announcing Changes to SwiftUI

import Combine
import Observation

final class ScoreBoard: ObservableObject {
    @Published var score = 0
    @Published private(set) var history: [Int] = []

    func add(points: Int) {
        score += points
        history.append(points)
    }

    var level: Int {
        score / 100 + 1
    }
}

@Observable
final class Playlist {
    var songs: [String] = []
    var isShuffled = false

    func add(_ song: String) {
        songs.append(song)
    }

    var totalCount: Int {
        songs.count
    }
}
