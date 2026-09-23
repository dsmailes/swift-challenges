// ════════════════════════════════════════════════════════════════════════
//  Challenge 67 · Task Groups                                  Difficulty ★★★
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `async let` is great for a FIXED number of concurrent operations. For a
//  DYNAMIC number, use a task group:
//
//      try await withThrowingTaskGroup(of: Result.self) { group in
//          for item in items {
//              group.addTask { try await work(item) }
//          }
//          for try await result in group { … }   // in COMPLETION order
//      }
//
//  Like `async let`, group tasks are structured: the group doesn't return
//  until every child finishes, and when a child's error is thrown out of the
//  group, the remaining children are cancelled.
//
//  Two things trip people up:
//  • results arrive in completion order, not submission order – carry an
//    index or key along with each result;
//  • adding thousands of tasks at once can overwhelm a server. Limit the
//    concurrency by adding N tasks up front, then one more each time one
//    finishes (`group.next()`).
//
//  YOUR TASK
//  1. `loadAllThumbnails(ids:loader:)` – load every thumbnail concurrently,
//     returning a dictionary keyed by id.
//  2. `loadThumbnails(ids:maxConcurrent:loader:)` – return the thumbnails
//     as an ARRAY in the same order as `ids`, never having more than
//     `maxConcurrent` loads in flight at once (but using all of them).
//  Both should throw if any load fails.
// ════════════════════════════════════════════════════════════════════════

protocol ThumbnailLoader: Sendable {
    func thumbnail(for id: Int) async throws -> String
}

func loadAllThumbnails(ids: [Int], loader: some ThumbnailLoader) async throws -> [Int: String] {
    // TODO
    [:]
}

func loadThumbnails(ids: [Int], maxConcurrent: Int, loader: some ThumbnailLoader) async throws -> [String] {
    // TODO
    []
}
