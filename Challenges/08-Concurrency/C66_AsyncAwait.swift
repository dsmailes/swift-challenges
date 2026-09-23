// ════════════════════════════════════════════════════════════════════════
//  Challenge 66 · async/await and async let                    Difficulty ★★☆
//  Related interview questions: "How much experience do you have with GCD?"
//  and "What steps would you follow to make a network request?" – modern
//  answers to both start with async/await.
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  An `async` function can suspend at each `await`, freeing its thread to do
//  other work until the result is ready. Plain sequential awaits run one
//  after another – right when step 2 needs step 1's result, but slow when the
//  steps are independent.
//
//  `async let` starts a child task immediately and lets you await its result
//  later, so independent work runs in PARALLEL:
//
//      async let a = fetchA()      // starts now
//      async let b = fetchB()      // also starts now
//      let result = try await (a, b)
//
//  Child tasks are *structured*: they can't outlive the scope that created
//  them, and if the parent throws or is cancelled, unfinished children are
//  cancelled automatically.
//
//  YOUR TASK
//  1. `loadDashboard(userID:service:)` – fetch the username, unread count,
//     and weather CONCURRENTLY with `async let`, then build a `Dashboard`.
//     (The tests check that all three were in flight at the same time.)
//  2. `loadAvatar(userID:service:)` – the avatar needs the username first,
//     so do these two steps SEQUENTIALLY.
//  Errors from the service should propagate to the caller.
// ════════════════════════════════════════════════════════════════════════

import Foundation

protocol DashboardService: Sendable {
    func fetchUsername(id: Int) async throws -> String
    func fetchUnreadCount(userID: Int) async throws -> Int
    func fetchWeather() async throws -> String
    func fetchAvatarURL(username: String) async throws -> URL
}

struct Dashboard: Equatable, Sendable {
    let username: String
    let unreadCount: Int
    let weather: String
}

func loadDashboard(userID: Int, service: some DashboardService) async throws -> Dashboard {
    // TODO
    Dashboard(username: "", unreadCount: 0, weather: "")
}

func loadAvatar(userID: Int, service: some DashboardService) async throws -> URL {
    // TODO
    URL(string: "about:blank")!
}
