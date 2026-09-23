// Solution · Challenge 72 · MainActor & Global Actors

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
        // Reentrancy guard: a second call during the await below sees .loading.
        guard state != .loading else { return }
        state = .loading

        do {
            let fetched = try await service.fetchPosts()
            posts = fetched
            state = .loaded(fetched.count)
        } catch {
            state = .failed(String(describing: error))
        }
    }

    nonisolated static func headline(for posts: [String]) -> String {
        switch posts.count {
        case 0: "No new posts"
        case 1: "1 new post"
        case let count: "\(count) new posts"
        }
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
        notes.append(note)
    }

    var count: Int {
        notes.count
    }

    func notes(containing text: String) -> [String] {
        notes.filter { $0.localizedCaseInsensitiveContains(text) }
    }
}
