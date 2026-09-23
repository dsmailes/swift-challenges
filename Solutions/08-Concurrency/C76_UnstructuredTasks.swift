// Solution · Challenge 76 · Unstructured Tasks: A Debouncer

actor AsyncDebouncer {
    private let delay: Duration
    private var pending: Task<Void, Never>?

    init(delay: Duration) {
        self.delay = delay
    }

    func submit(_ action: @escaping @Sendable () async -> Void) {
        pending?.cancel()
        pending = Task { [delay] in
            do {
                try await Task.sleep(for: delay)
            } catch {
                return // Cancelled by a newer submission.
            }
            await action()
        }
    }

    func cancel() {
        pending?.cancel()
        pending = nil
    }
}
