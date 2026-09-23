// ════════════════════════════════════════════════════════════════════════
//  Challenge 57 · Grand Central Dispatch                       Difficulty ★★★
//  Interview question: "How much experience do you have with GCD?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  GCD schedules closures on queues. Serial queues run one block at a time
//  (handy for protecting shared state), concurrent queues run many at once,
//  `DispatchQueue.concurrentPerform` spreads a loop across CPU cores, and a
//  `DispatchGroup` tells you when a batch of async work has all finished.
//  Modern Swift code usually prefers async/await and actors – see the
//  Concurrency challenges (C66+) – but GCD is everywhere in existing code.
//
//  YOUR TASK
//  1. `ThreadSafeCounter` – currently has a data race. Protect `value` with
//     the private serial `queue` (`queue.sync { … }`) for both reads and
//     writes.
//  2. `parallelSquareSum(_:)` – use `DispatchQueue.concurrentPerform` to
//     sum the squares of the numbers in parallel. Split the array into chunks,
//     compute each chunk's partial sum, and combine them safely (a `Mutex`
//     from the Synchronization module works well).
//  3. `fetchAll(ids:fetch:completion:)` – call `fetch` for every id (each
//     calls back on an arbitrary thread), and call `completion` ONCE with a
//     dictionary of every result after they have all arrived. Use a
//     `DispatchGroup` with `enter()` / `leave()` / `notify(queue:)`, and store
//     results safely.
// ════════════════════════════════════════════════════════════════════════

import Dispatch
import Foundation
import Synchronization

final class ThreadSafeCounter: @unchecked Sendable {
    private var value = 0
    private let queue = DispatchQueue(label: "SwiftChallenges.counter")

    func increment() {
        // TODO: not thread-safe!
        value += 1
    }

    var current: Int {
        // TODO: not thread-safe!
        value
    }
}

func parallelSquareSum(_ numbers: [Int]) -> Int {
    // TODO
    0
}

func fetchAll(
    ids: [Int],
    fetch: @escaping @Sendable (Int, @escaping @Sendable (String) -> Void) -> Void,
    completion: @escaping @Sendable ([Int: String]) -> Void
) {
    // TODO
    completion([:])
}
