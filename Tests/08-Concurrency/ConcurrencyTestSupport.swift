// Shared helpers for the Concurrency test suites.

/// Tracks how many operations are running at once.
actor ConcurrencyProbe {
    private(set) var current = 0
    private(set) var maximum = 0
    private(set) var calls = 0

    func enter() {
        current += 1
        calls += 1
        maximum = max(maximum, current)
    }

    func exit() {
        current -= 1
    }

    /// Runs `body` while counted as "in flight".
    func measure<T: Sendable>(delay: Duration = .milliseconds(30), _ value: T) async throws -> T {
        enter()
        defer { exit() }
        try await Task.sleep(for: delay)
        return value
    }
}

/// A concurrency-safe, append-only log.
actor Recorder<Element: Sendable> {
    private(set) var items: [Element] = []

    func append(_ item: Element) {
        items.append(item)
    }
}
