// ════════════════════════════════════════════════════════════════════════
//  Challenge 75 · Cancellation & Timeouts                      Difficulty ★★★
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Swift's cancellation is COOPERATIVE. Calling `task.cancel()` just sets a
//  flag; your code has to notice it:
//  • `try Task.checkCancellation()` – throws `CancellationError` if cancelled
//  • `Task.isCancelled` – check the flag and clean up however you like
//  • many system APIs (e.g. `Task.sleep`, URLSession) check for you
//  • `withTaskCancellationHandler` – react immediately, e.g. to cancel a
//    legacy operation
//  Cancellation flows DOWN structured concurrency: cancelling a parent
//  cancels its `async let` children and task-group children.
//
//  A timeout is a race: run the operation and a sleep side by side in a task
//  group; whichever finishes first wins, then cancel the loser.
//
//  YOUR TASK
//  1. `fetchAllPages(count:fetcher:)` – fetch pages 1…count one after
//     another and concatenate their items. The fetcher IGNORES cancellation,
//     so check it yourself before each page and throw `CancellationError`.
//  2. `withTimeout(_:operation:)` – return the operation's result if it
//     finishes within `duration`, otherwise throw `TimeoutError` (and make
//     sure the slow operation is cancelled rather than left running).
// ════════════════════════════════════════════════════════════════════════

protocol PageFetcher: Sendable {
    func fetchPage(_ number: Int) async -> [String]
}

struct TimeoutError: Error, Equatable {}

func fetchAllPages(count: Int, fetcher: some PageFetcher) async throws -> [String] {
    // TODO
    []
}

func withTimeout<T: Sendable>(
    _ duration: Duration,
    operation: @escaping @Sendable () async throws -> T
) async throws -> T {
    // TODO
    try await operation()
}
