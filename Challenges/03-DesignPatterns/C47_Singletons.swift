// ════════════════════════════════════════════════════════════════════════
//  Challenge 47 · Singletons                                   Difficulty ★☆☆
//  Interview question: "Can you give some examples of where singletons
//  might be a good idea?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A singleton guarantees exactly one shared instance, e.g. `URLSession.shared`
//  or `UserDefaults.standard`. In Swift that's a `static let shared` (lazily
//  and thread-safely initialized) plus a `private init()` so nobody can make
//  another. Singletons are global mutable state, though, so they make testing
//  harder – prefer dependency injection (Challenge 43) where possible.
//
//  In Swift 6, a shared mutable instance must be concurrency-safe. Here it's
//  isolated to the main actor, which suits app-wide UI settings.
//
//  YOUR TASK
//  1. Fix `shared` so it always returns the SAME instance.
//  2. Make `init()` private.
//  3. `recordLaunch()` – increment `launchCount`.
//  4. `reset()` – restore theme to "system" and launchCount to 0.
// ════════════════════════════════════════════════════════════════════════

@MainActor
final class AppSettings {
    static var shared: AppSettings { AppSettings() } // TODO: wrong!

    var theme = "system"
    private(set) var launchCount = 0

    init() {} // TODO: shouldn't be accessible from outside

    func recordLaunch() {
        // TODO
    }

    func reset() {
        // TODO
    }
}
