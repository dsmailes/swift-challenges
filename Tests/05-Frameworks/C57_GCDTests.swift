import Dispatch
import Synchronization
import Testing
@testable import Challenges

@Suite("C57 · Grand Central Dispatch")
struct C57_GCDTests {
    @Test func counterIsThreadSafe() {
        let counter = ThreadSafeCounter()
        DispatchQueue.concurrentPerform(iterations: 10_000) { _ in
            counter.increment()
        }
        #expect(counter.current == 10_000)
    }

    @Test func squareSums() {
        #expect(parallelSquareSum(Array(1...1000)) == 333_833_500)
        #expect(parallelSquareSum([3]) == 9)
        #expect(parallelSquareSum([]) == 0)
    }

    @Test func fetchesEverything() async {
        let calls = Mutex(0)
        let results = await withCheckedContinuation { continuation in
            fetchAll(
                ids: Array(1...20),
                fetch: { id, callback in
                    DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(Int.random(in: 1...20))) {
                        callback("item-\(id)")
                    }
                },
                completion: { results in
                    calls.withLock { $0 += 1 }
                    continuation.resume(returning: results)
                }
            )
        }

        #expect(results.count == 20)
        #expect(results[7] == "item-7")
        #expect(calls.withLock { $0 } == 1)
    }
}
