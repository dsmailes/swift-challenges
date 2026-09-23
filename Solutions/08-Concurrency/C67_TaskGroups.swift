// Solution · Challenge 67 · Task Groups

protocol ThumbnailLoader: Sendable {
    func thumbnail(for id: Int) async throws -> String
}

func loadAllThumbnails(ids: [Int], loader: some ThumbnailLoader) async throws -> [Int: String] {
    try await withThrowingTaskGroup(of: (Int, String).self) { group in
        for id in ids {
            group.addTask { (id, try await loader.thumbnail(for: id)) }
        }

        var results: [Int: String] = [:]
        for try await (id, thumbnail) in group {
            results[id] = thumbnail
        }
        return results
    }
}

func loadThumbnails(ids: [Int], maxConcurrent: Int, loader: some ThumbnailLoader) async throws -> [String] {
    precondition(maxConcurrent > 0, "maxConcurrent must be positive")

    return try await withThrowingTaskGroup(of: (Int, String).self) { group in
        var results = [String?](repeating: nil, count: ids.count)
        var nextIndex = 0

        // Fill the initial window.
        while nextIndex < min(maxConcurrent, ids.count) {
            let index = nextIndex
            let id = ids[index]
            group.addTask { (index, try await loader.thumbnail(for: id)) }
            nextIndex += 1
        }

        // Each time one finishes, start the next.
        while let (index, thumbnail) = try await group.next() {
            results[index] = thumbnail

            if nextIndex < ids.count {
                let index = nextIndex
                let id = ids[index]
                group.addTask { (index, try await loader.thumbnail(for: id)) }
                nextIndex += 1
            }
        }

        return results.map { $0! }
    }
}
