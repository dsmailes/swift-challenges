// Solution · Challenge 57 · Grand Central Dispatch

import Dispatch
import Foundation
import Synchronization

final class ThreadSafeCounter: @unchecked Sendable {
    private var value = 0
    private let queue = DispatchQueue(label: "SwiftChallenges.counter")

    func increment() {
        queue.sync { value += 1 }
    }

    var current: Int {
        queue.sync { value }
    }
}

func parallelSquareSum(_ numbers: [Int]) -> Int {
    guard !numbers.isEmpty else { return 0 }

    let chunkCount = min(numbers.count, ProcessInfo.processInfo.activeProcessorCount * 4)
    let chunkSize = (numbers.count + chunkCount - 1) / chunkCount
    let total = Mutex(0)

    DispatchQueue.concurrentPerform(iterations: chunkCount) { chunk in
        let start = chunk * chunkSize
        let end = min(start + chunkSize, numbers.count)
        guard start < end else { return }

        let partial = numbers[start..<end].reduce(0) { $0 + $1 * $1 }
        total.withLock { $0 += partial }
    }

    return total.withLock { $0 }
}

/// A tiny lock-protected box so escaping closures can share results safely.
private final class ResultStore: Sendable {
    private let results = Mutex<[Int: String]>([:])

    func set(_ value: String, for id: Int) {
        results.withLock { $0[id] = value }
    }

    var snapshot: [Int: String] {
        results.withLock { $0 }
    }
}

func fetchAll(
    ids: [Int],
    fetch: @escaping @Sendable (Int, @escaping @Sendable (String) -> Void) -> Void,
    completion: @escaping @Sendable ([Int: String]) -> Void
) {
    let group = DispatchGroup()
    let store = ResultStore()

    for id in ids {
        group.enter()
        fetch(id) { value in
            store.set(value, for: id)
            group.leave()
        }
    }

    group.notify(queue: .global()) {
        completion(store.snapshot)
    }
}
