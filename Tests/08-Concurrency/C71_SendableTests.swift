import Dispatch
import Testing
@testable import Challenges

@Suite("C71 · Sendable & Data-Race Safety")
struct C71_SendableTests {
    @Test func protectedBoxSurvivesContention() {
        let box = Protected(0)
        DispatchQueue.concurrentPerform(iterations: 20_000) { _ in
            box.withLock { $0 += 1 }
        }
        #expect(box.current == 20_000)
    }

    @Test func withLockReturnsValues() {
        let box = Protected([1, 2, 3])
        let count = box.withLock { values -> Int in
            values.append(4)
            return values.count
        }
        #expect(count == 4)
        #expect(box.current == [1, 2, 3, 4])
    }

    @Test func hitCounterFromManyTasks() async {
        let counter = HitCounter()
        let pages = ["/", "/about", "/blog", "/contact"]

        await withTaskGroup(of: Void.self) { group in
            for index in 0..<2_000 {
                group.addTask { counter.record(pages[index % pages.count]) }
            }
        }

        #expect(counter.total == 2_000)
        #expect(counter.hits(for: "/blog") == 500)
        #expect(counter.hits(for: "/missing") == 0)
    }
}
