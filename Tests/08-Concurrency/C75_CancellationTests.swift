import Testing
@testable import Challenges

@Suite("C75 · Cancellation & Timeouts")
struct C75_CancellationTests {
    /// Deliberately ignores cancellation, like much real-world code.
    struct StubbornFetcher: PageFetcher {
        let probe = ConcurrencyProbe()

        func fetchPage(_ number: Int) async -> [String] {
            await probe.enter()
            try? await Task.sleep(for: .milliseconds(20)) // returns early if cancelled, never throws
            await probe.exit()
            return ["p\(number)-a", "p\(number)-b"]
        }
    }

    @Test func fetchesAllPagesInOrder() async throws {
        let items = try await fetchAllPages(count: 3, fetcher: StubbornFetcher())
        #expect(items == ["p1-a", "p1-b", "p2-a", "p2-b", "p3-a", "p3-b"])
    }

    @Test func stopsWhenCancelled() async throws {
        let fetcher = StubbornFetcher()
        let task = Task { try await fetchAllPages(count: 50, fetcher: fetcher) }
        try await Task.sleep(for: .milliseconds(70))
        task.cancel()

        await #expect(throws: CancellationError.self) {
            try await task.value
        }
        #expect(await fetcher.probe.calls < 50)
    }

    @Test func fastOperationBeatsTimeout() async throws {
        let value = try await withTimeout(.seconds(1)) {
            try await Task.sleep(for: .milliseconds(10))
            return 42
        }
        #expect(value == 42)
    }

    @Test func slowOperationTimesOut() async {
        let clock = ContinuousClock()
        let start = clock.now

        await #expect(throws: TimeoutError.self) {
            try await withTimeout(.milliseconds(50)) {
                try await Task.sleep(for: .seconds(2))
                return "too slow"
            }
        }
        #expect(clock.now - start < .seconds(1), "Timed-out work must be cancelled, not awaited")
    }

    @Test func operationErrorsPassThrough() async {
        struct Boom: Error {}
        await #expect(throws: Boom.self) {
            try await withTimeout(.seconds(1)) { () async throws -> Int in throw Boom() }
        }
    }
}
