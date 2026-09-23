// Solution · Challenge 75 · Cancellation & Timeouts

protocol PageFetcher: Sendable {
    func fetchPage(_ number: Int) async -> [String]
}

struct TimeoutError: Error, Equatable {}

func fetchAllPages(count: Int, fetcher: some PageFetcher) async throws -> [String] {
    var items: [String] = []
    for page in stride(from: 1, through: count, by: 1) {
        try Task.checkCancellation()
        items += await fetcher.fetchPage(page)
    }
    return items
}

func withTimeout<T: Sendable>(
    _ duration: Duration,
    operation: @escaping @Sendable () async throws -> T
) async throws -> T {
    try await withThrowingTaskGroup(of: T.self) { group in
        group.addTask {
            try await operation()
        }
        group.addTask {
            try await Task.sleep(for: duration)
            throw TimeoutError()
        }

        // Whichever child finishes first decides the outcome…
        defer { group.cancelAll() } // …and the loser is cancelled.
        return try await group.next()!
    }
}
