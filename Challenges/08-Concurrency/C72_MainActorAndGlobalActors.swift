// ════════════════════════════════════════════════════════════════════════
//  Challenge 72 · MainActor & Global Actors                    Difficulty ★★★
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `@MainActor` is a *global actor*: a single, app-wide actor that runs on
//  the main thread. Marking a type `@MainActor` means all of its state is
//  only touched on the main thread – exactly what UI code needs. When a
//  main-actor method `await`s slow work, the main thread is NOT blocked; it
//  keeps handling UI events and resumes the method afterwards.
//
//  That same `await` is a reentrancy point (see C69): a second tap can call
//  `load()` again while the first load is still suspended. Guard against it.
//
//  You can declare your own global actors too – handy for serializing all
//  access to a shared resource such as a database:
//
//      @globalActor actor DatabaseActor {
//          static let shared = DatabaseActor()
//      }
//      @DatabaseActor final class NoteDatabase { … }   // isolated to it
//
//  `nonisolated` opts a member OUT of its type's actor, for pure logic that
//  doesn't touch isolated state – it can then be called synchronously from
//  any thread.
//
//  YOUR TASK
//  1. `FeedViewModel.load()`:
//       • if a load is already in progress, return immediately
//       • set `state` to `.loading`, then await `service.fetchPosts()`
//       • on success store `posts` and set `.loaded(count)`
//       • on failure set `.failed(<String(describing: error)>)`
//     (Every change to `state` is appended to `history` for the tests.)
//  2. `FeedViewModel.headline(for:)` – a nonisolated helper:
//       0 → "No new posts", 1 → "1 new post", n → "n new posts"
//  3. `NoteDatabase` – implement `insert(_:)`, `count`, and
//     `notes(containing:)` (case-insensitive). It's isolated to
//     `DatabaseActor`, so it's safe to use from many tasks at once.
//  Think: why does every test need `await` to touch `NoteDatabase`?
// ════════════════════════════════════════════════════════════════════════

enum LoadState: Equatable, Sendable {
    case idle
    case loading
    case loaded(Int)
    case failed(String)
}

protocol FeedService: Sendable {
    func fetchPosts() async throws -> [String]
}

@MainActor
final class FeedViewModel {
    private(set) var posts: [String] = []
    private(set) var history: [LoadState] = []
    private(set) var state: LoadState = .idle {
        didSet { history.append(state) }
    }

    private let service: any FeedService

    init(service: any FeedService) {
        self.service = service
    }

    func load() async {
        // TODO
    }

    nonisolated static func headline(for posts: [String]) -> String {
        // TODO
        ""
    }
}

@globalActor
actor DatabaseActor {
    static let shared = DatabaseActor()
}

@DatabaseActor
final class NoteDatabase {
    private var notes: [String] = []

    init() {}

    func insert(_ note: String) {
        // TODO
    }

    var count: Int {
        // TODO
        0
    }

    func notes(containing text: String) -> [String] {
        // TODO
        []
    }
}
