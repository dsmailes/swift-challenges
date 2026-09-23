import Testing
@testable import Challenges

@MainActor
@Suite("C72 · MainActor & Global Actors")
struct C72_MainActorAndGlobalActorsTests {
    struct Offline: Error, CustomStringConvertible {
        var description: String { "offline" }
    }

    struct MockFeed: FeedService {
        let probe = ConcurrencyProbe()
        var fails = false

        func fetchPosts() async throws -> [String] {
            let posts = try await probe.measure(["a", "b", "c"])
            if fails { throw Offline() }
            return posts
        }
    }

    @Test func successfulLoad() async {
        let viewModel = FeedViewModel(service: MockFeed())
        await viewModel.load()
        #expect(viewModel.posts == ["a", "b", "c"])
        #expect(viewModel.history == [.loading, .loaded(3)])
    }

    @Test func failedLoad() async {
        let viewModel = FeedViewModel(service: MockFeed(fails: true))
        await viewModel.load()
        #expect(viewModel.state == .failed("offline"))
        #expect(viewModel.history == [.loading, .failed("offline")])
    }

    @Test func overlappingLoadsFetchOnce() async {
        let feed = MockFeed()
        let viewModel = FeedViewModel(service: feed)
        async let first: Void = viewModel.load()
        async let second: Void = viewModel.load()
        _ = await (first, second)

        #expect(await feed.probe.calls == 1)
        #expect(viewModel.history == [.loading, .loaded(3)])
    }

    @Test func headlinesFromAnyThread() async {
        let headline = await Task.detached {
            FeedViewModel.headline(for: ["x", "y"]) // nonisolated: no await needed
        }.value
        #expect(headline == "2 new posts")
        #expect(FeedViewModel.headline(for: ["x"]) == "1 new post")
        #expect(FeedViewModel.headline(for: []) == "No new posts")
    }

    @Test func databaseFromManyTasks() async {
        let database = await NoteDatabase()
        await withTaskGroup(of: Void.self) { group in
            for index in 0..<200 {
                group.addTask { await database.insert(index.isMultiple(of: 2) ? "Buy milk \(index)" : "Call Mum \(index)") }
            }
        }
        #expect(await database.count == 200)
        #expect(await database.notes(containing: "MILK").count == 100)
    }
}
