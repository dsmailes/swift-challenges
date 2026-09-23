// ════════════════════════════════════════════════════════════════════════
//  Challenge 76 · Unstructured Tasks: A Debouncer              Difficulty ★★★
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `Task { … }` creates an *unstructured* task: it isn't tied to the scope
//  that created it, so it can outlive the function – you keep a handle if you
//  want to cancel it or await its value. It inherits the current actor and
//  priority. (`Task.detached { … }` inherits neither – rarely what you want.)
//
//  Keeping a handle to the latest task and cancelling it when something new
//  arrives is the basis of a debouncer: e.g. only search once the user has
//  STOPPED typing for 300 ms.
//
//  YOUR TASK
//  Implement `AsyncDebouncer` (an actor, so `pending` is safe):
//  • `submit(_:)` – cancel any pending action, then start a new task that
//    sleeps for `delay` and runs the action only if it wasn't cancelled.
//    Only the LAST action in a burst should run.
//  • `cancel()` – cancel the pending action without running it.
//  Hint: `Task.sleep` throws `CancellationError` when cancelled – use that
//  to skip the action.
// ════════════════════════════════════════════════════════════════════════

actor AsyncDebouncer {
    private let delay: Duration
    private var pending: Task<Void, Never>?

    init(delay: Duration) {
        self.delay = delay
    }

    func submit(_ action: @escaping @Sendable () async -> Void) {
        // TODO: debounce!
        Task { await action() }
    }

    func cancel() {
        // TODO
    }
}
