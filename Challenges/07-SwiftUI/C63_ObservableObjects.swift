// ════════════════════════════════════════════════════════════════════════
//  Challenge 63 · Announcing Changes to SwiftUI                Difficulty ★★☆
//  Interview questions: "What does the `@Published` property wrapper do?",
//  "How can an observable object announce changes to SwiftUI?", and "When
//  would you use `@StateObject` versus `@ObservedObject`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  There are two generations of observation in SwiftUI:
//  • Combine-based: a class conforms to `ObservableObject`, and each
//    `@Published` property sends `objectWillChange` before it changes.
//    Views own such objects with `@StateObject` (create once) and receive
//    them with `@ObservedObject` (owned elsewhere).
//  • The Observation framework (iOS 17 / macOS 14+): mark the class
//    `@Observable` and SwiftUI tracks exactly which properties each view
//    reads. Views own them with plain `@State`.
//
//  YOUR TASK
//  1. `ScoreBoard` – make it announce changes the Combine way:
//       • conform to `ObservableObject`, make `score` and `history` `@Published`
//       • `add(points:)` – add to score and append the points to history
//       • `level` – computed: score / 100 (integer division) + 1
//  2. `Playlist` – make it `@Observable`, and implement `add(_:)` and
//     `totalCount`.
//  (The tests use `objectWillChange` and `withObservationTracking` to check
//  that changes are really announced.)
// ════════════════════════════════════════════════════════════════════════

import Combine
import Observation

final class ScoreBoard {
    var score = 0
    private(set) var history: [Int] = []

    func add(points: Int) {
        // TODO
    }

    var level: Int {
        // TODO
        0
    }
}

final class Playlist {
    var songs: [String] = []
    var isShuffled = false

    func add(_ song: String) {
        // TODO
    }

    var totalCount: Int {
        // TODO
        0
    }
}
