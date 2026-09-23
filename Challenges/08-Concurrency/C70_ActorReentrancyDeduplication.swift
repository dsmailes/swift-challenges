// ════════════════════════════════════════════════════════════════════════
//  Challenge 70 · Actor Reentrancy: Duplicate Work             Difficulty ★★★
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  The classic reentrancy bug in caches:
//
//      if let cached = cache[url] { return cached }   // miss
//      let data = try await loader.load(url)          // 💤 suspends…
//      cache[url] = data
//
//  While the first caller is suspended, ten more callers asking for the same
//  URL also miss the cache, and ALL of them start their own download. The
//  code is data-race free (it's an actor!) yet still wrong.
//
//  The fix is to remember work that's IN PROGRESS, not just finished
//  results. Store a `Task` the moment you start loading; later callers find
//  that task and simply `await task.value`, sharing the single download:
//
//      enum Entry {
//          case inProgress(Task<Data, any Error>)
//          case ready(Data)
//      }
//
//  YOUR TASK
//  Fix `ImageCache.image(for:)` so that:
//  • any number of concurrent requests for one URL trigger exactly ONE load
//  • all those callers receive the same data
//  • different URLs still load in parallel
//  • a failed load is NOT cached – every waiter gets the error, and a later
//    request retries
//  • `cachedCount` counts only finished, successful entries.
// ════════════════════════════════════════════════════════════════════════

import Foundation

protocol ImageLoader: Sendable {
    func loadImage(from url: URL) async throws -> Data
}

actor ImageCache {
    private var cache: [URL: Data] = [:]
    private let loader: any ImageLoader

    init(loader: any ImageLoader) {
        self.loader = loader
    }

    func image(for url: URL) async throws -> Data {
        // TODO: this has a reentrancy bug!
        if let cached = cache[url] {
            return cached
        }

        let data = try await loader.loadImage(from: url)
        cache[url] = data
        return data
    }

    var cachedCount: Int {
        cache.count
    }
}
