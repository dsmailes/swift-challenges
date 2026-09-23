import Testing
@testable import Challenges

@Suite("C67 · Task Groups")
struct C67_TaskGroupsTests {
    struct BrokenImage: Error {}

    struct MockLoader: ThumbnailLoader {
        let probe = ConcurrencyProbe()
        var failingID: Int?

        func thumbnail(for id: Int) async throws -> String {
            // Later ids finish sooner, so completion order ≠ submission order.
            let delay = Duration.milliseconds(10 + (20 - id % 20) * 2)
            let value = try await probe.measure(delay: delay, "thumb-\(id)")
            if id == failingID { throw BrokenImage() }
            return value
        }
    }

    @Test func loadsEverythingConcurrently() async throws {
        let loader = MockLoader()
        let results = try await loadAllThumbnails(ids: Array(1...10), loader: loader)
        #expect(results.count == 10)
        #expect(results[4] == "thumb-4")
        #expect(await loader.probe.maximum == 10)
    }

    @Test func preservesOrder() async throws {
        let ids = Array(1...12)
        let results = try await loadThumbnails(ids: ids, maxConcurrent: 4, loader: MockLoader())
        #expect(results == ids.map { "thumb-\($0)" })
    }

    @Test func respectsConcurrencyLimit() async throws {
        let loader = MockLoader()
        _ = try await loadThumbnails(ids: Array(1...12), maxConcurrent: 3, loader: loader)
        #expect(await loader.probe.maximum == 3)
        #expect(await loader.probe.calls == 12)
    }

    @Test func emptyInput() async throws {
        #expect(try await loadThumbnails(ids: [], maxConcurrent: 3, loader: MockLoader()) == [])
    }

    @Test func errorsPropagate() async {
        await #expect(throws: BrokenImage.self) {
            try await loadAllThumbnails(ids: Array(1...5), loader: MockLoader(failingID: 3))
        }
        await #expect(throws: BrokenImage.self) {
            try await loadThumbnails(ids: Array(1...5), maxConcurrent: 2, loader: MockLoader(failingID: 3))
        }
    }
}
