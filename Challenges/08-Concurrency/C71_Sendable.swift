// ════════════════════════════════════════════════════════════════════════
//  Challenge 71 · Sendable & Data-Race Safety                  Difficulty ★★★
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `Sendable` marks types that are safe to share between concurrency
//  domains (tasks, actors, threads). In Swift 6 language mode the compiler
//  refuses to let non-Sendable values cross those boundaries, which turns
//  whole classes of data races into compile errors. Things that are
//  Sendable:
//  • value types whose stored properties are all Sendable (often implicit)
//  • actors (they protect their own state)
//  • final classes with only immutable (`let`) Sendable stored properties
//  • types that protect their state internally with a lock, e.g. `Mutex`
//    from the Synchronization module
//
//  `@unchecked Sendable` tells the compiler "trust me" and switches the
//  checks OFF. It's sometimes needed (wrapping old lock-based code), but
//  any mistake becomes a silent data race. Keep it rare, small and audited.
//
//  YOUR TASK
//  1. `Protected<Value>` – a thread-safe box. As written it's marked
//     `@unchecked Sendable` but does NO locking: concurrent `withLock`
//     calls race and lose updates. Make it genuinely safe – ideally by
//     storing the value in a `Mutex` so you can drop `@unchecked` entirely.
//  2. `HitCounter` – count page views from many threads at once. Implement it
//     on top of `Protected`, and make it a plain `Sendable` final class (no
//     `@unchecked`!). The compiler will verify it for you: every stored
//     property must be a Sendable `let`.
//
//  TIP: turn on Thread Sanitizer (Scheme → Test → Diagnostics) and run the
//  tests against the original code to watch it catch the race.
// ════════════════════════════════════════════════════════════════════════

import Synchronization

final class Protected<Value: Sendable>: @unchecked Sendable {
    private var value: Value // TODO: not protected!

    init(_ value: Value) {
        self.value = value
    }

    func withLock<Result: Sendable>(_ body: (inout Value) throws -> Result) rethrows -> Result {
        // TODO
        try body(&value)
    }

    var current: Value {
        // TODO
        value
    }
}

final class HitCounter: @unchecked Sendable { // TODO: should be checked Sendable
    func record(_ page: String) {
        // TODO
    }

    func hits(for page: String) -> Int {
        // TODO
        0
    }

    var total: Int {
        // TODO
        0
    }
}
