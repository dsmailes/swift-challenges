// Solution · Challenge 71 · Sendable & Data-Race Safety

import Synchronization

final class Protected<Value: Sendable>: Sendable {
    private let storage: Mutex<Value>

    init(_ value: Value) {
        storage = Mutex(value)
    }

    func withLock<Result: Sendable>(_ body: (inout Value) throws -> Result) rethrows -> Result {
        try storage.withLock { value in
            try body(&value)
        }
    }

    var current: Value {
        storage.withLock { $0 }
    }
}

// Checked Sendable: its only stored property is a Sendable `let`.
final class HitCounter: Sendable {
    private let counts = Protected<[String: Int]>([:])

    func record(_ page: String) {
        counts.withLock { $0[page, default: 0] += 1 }
    }

    func hits(for page: String) -> Int {
        counts.current[page, default: 0]
    }

    var total: Int {
        counts.current.values.reduce(0, +)
    }
}
