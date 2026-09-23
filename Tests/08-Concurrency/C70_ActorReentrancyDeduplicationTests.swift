import Foundation
import Testing
@testable import Challenges

@Suite("C70 · Actor Reentrancy: Duplicate Work")
struct C70_ActorReentrancyDeduplicationTests {
    struct NetworkDown: Error {}

    actor MockLoader: ImageLoader {
        private(set) var loadCounts: [URL: Int] = [:]
        private var failuresRemaining: [URL: Int] = [:]

        func failNext(_ count: Int, for url: URL) {
            failuresRemaining[url] = count
        }

        func loadImage(from url: URL) async throws -> Data {
            loadCounts[url, default: 0] += 1
            try await Task.sleep(for: .milliseconds(30)) // reentrancy window!
            if let remaining = failuresRemaining[url], remaining > 0 {
                failuresRemaining[url] = remaining - 1
                throw NetworkDown()
            }
            return Data(url.absoluteString.utf8)
        }
    }

    let cat = URL(string: "https://example.com/cat.png")!
    let dog = URL(string: "https://example.com/dog.png")!

    @Test func cachesResults() async throws {
        let loader = MockLoader()
        let cache = ImageCache(loader: loader)
        _ = try await cache.image(for: cat)
        let data = try await cache.image(for: cat)
        #expect(data == Data(cat.absoluteString.utf8))
        #expect(await loader.loadCounts[cat] == 1)
    }

    @Test func concurrentRequestsShareOneLoad() async throws {
        let loader = MockLoader()
        let cache = ImageCache(loader: loader)

        let results = try await withThrowingTaskGroup(of: Data.self) { group in
            for _ in 0..<10 {
                group.addTask { try await cache.image(for: self.cat) }
            }
            return try await group.reduce(into: []) { $0.append($1) }
        }

        #expect(results.count == 10)
        #expect(Set(results).count == 1)
        #expect(await loader.loadCounts[cat] == 1, "Every caller started its own download")
        #expect(await cache.cachedCount == 1)
    }

    @Test func differentURLsLoadIndependently() async throws {
        let loader = MockLoader()
        let cache = ImageCache(loader: loader)
        async let a = cache.image(for: cat)
        async let b = cache.image(for: dog)
        async let c = cache.image(for: cat)
        _ = try await (a, b, c)
        #expect(await loader.loadCounts == [cat: 1, dog: 1])
    }

    @Test func failuresAreNotCached() async throws {
        let loader = MockLoader()
        await loader.failNext(1, for: cat)
        let cache = ImageCache(loader: loader)

        await #expect(throws: NetworkDown.self) { try await cache.image(for: cat) }
        #expect(await cache.cachedCount == 0)

        let data = try await cache.image(for: cat)
        #expect(data == Data(cat.absoluteString.utf8))
        #expect(await loader.loadCounts[cat] == 2)
    }

    @Test func allWaitersSeeTheFailure() async {
        let loader = MockLoader()
        await loader.failNext(1, for: dog)
        let cache = ImageCache(loader: loader)

        let failures = await withTaskGroup(of: Bool.self) { group in
            for _ in 0..<5 {
                group.addTask {
                    do { _ = try await cache.image(for: self.dog); return false }
                    catch { return true }
                }
            }
            return await group.reduce(0) { $0 + ($1 ? 1 : 0) }
        }

        #expect(failures == 5)
        #expect(await loader.loadCounts[dog] == 1)
    }
}
