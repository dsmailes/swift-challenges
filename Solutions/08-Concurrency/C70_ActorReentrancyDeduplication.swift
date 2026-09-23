// Solution · Challenge 70 · Actor Reentrancy: Duplicate Work

import Foundation

protocol ImageLoader: Sendable {
    func loadImage(from url: URL) async throws -> Data
}

actor ImageCache {
    private enum Entry {
        case inProgress(Task<Data, any Error>)
        case ready(Data)
    }

    private var entries: [URL: Entry] = [:]
    private let loader: any ImageLoader

    init(loader: any ImageLoader) {
        self.loader = loader
    }

    func image(for url: URL) async throws -> Data {
        if let entry = entries[url] {
            switch entry {
            case .ready(let data):
                return data
            case .inProgress(let task):
                return try await task.value // Share the in-flight load.
            }
        }

        // Record the in-flight task BEFORE suspending, so reentrant callers
        // find it instead of starting their own download.
        let loader = loader
        let task = Task { try await loader.loadImage(from: url) }
        entries[url] = .inProgress(task)

        do {
            let data = try await task.value
            entries[url] = .ready(data)
            return data
        } catch {
            entries[url] = nil // Don't cache failures – allow retries.
            throw error
        }
    }

    var cachedCount: Int {
        entries.values.filter {
            if case .ready = $0 { true } else { false }
        }.count
    }
}
