// ════════════════════════════════════════════════════════════════════════
//  Challenge 17 · Escaping vs Non-Escaping Closures            Difficulty ★★☆
//  Interview question: "What is the difference between an escaping closure
//  and a non-escaping closure?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Closure parameters are non-escaping by default: they must be called (or
//  not) before the function returns. If a closure is stored for later – in a
//  property, an array, or passed to async work – it *escapes*, and must be
//  marked `@escaping`. Escaping closures may outlive the call, which is why
//  they force you to think about capturing `self`.
//
//  YOUR TASK
//  1. `TaskQueue`
//       • `enqueue(_:)` stores the closure to run later (notice the
//         `@escaping` – try removing it and read the compiler error!)
//       • `pendingCount` – how many tasks are waiting
//       • `runAll()` – run every pending task in FIFO order, then clear them.
//         Tasks enqueued *while* running should wait for the next runAll().
//  2. `measure(_:)` – a non-escaping closure: call `work` immediately and
//     return its result along with how many times it was called (always 1).
// ════════════════════════════════════════════════════════════════════════

final class TaskQueue {
    private var tasks: [() -> Void] = []

    func enqueue(_ task: @escaping () -> Void) {
        // TODO
    }

    var pendingCount: Int {
        // TODO
        0
    }

    func runAll() {
        // TODO
    }
}

func measure(_ work: () -> Int) -> (result: Int, calls: Int) {
    // TODO
    (0, 0)
}
