// ════════════════════════════════════════════════════════════════════════
//  Challenge 25 · Compiler Directives & Availability           Difficulty ★☆☆
//  Interview questions: "What does the `#error` compiler directive do?",
//  "What does the `#if swift` syntax do?", "What does the `canImport()`
//  compiler condition do?", "What does the `targetEnvironment()` compiler
//  condition do?", and "What does the `#available` syntax do?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `#if` conditions are evaluated at COMPILE time – code in a false branch
//  isn't even compiled. Useful conditions include `os(…)`, `swift(>=…)`,
//  `canImport(…)`, `targetEnvironment(simulator)` and custom flags like
//  `DEBUG`. `#error("message")` / `#warning("message")` stop or warn the
//  build. `#available` / `if #available(…)` is different: a RUNTIME check of
//  the OS version the app is running on.
//
//  YOUR TASK
//  Implement each property using the matching compiler condition – no
//  hard-coded answers!
//    • `platformName` – "macOS", "iOS", "watchOS", "tvOS", "visionOS", or
//      "unknown"  (#if os(…))
//    • `isSimulator` – #if targetEnvironment(simulator)
//    • `hasCryptoKit` – #if canImport(CryptoKit)
//    • `isSwift6OrLater` – #if swift(>=6.0)
//    • `isDebugBuild` – #if DEBUG
//    • `supportsMacOS15APIs()` – `if #available(macOS 15, *)`
//
//  BONUS: add `#warning("Remember to remove this")` somewhere and watch the
//  Issue navigator. Then try `#error` – and remove it again!
// ════════════════════════════════════════════════════════════════════════

enum BuildInfo {
    static var platformName: String {
        // TODO
        ""
    }

    static var isSimulator: Bool {
        // TODO
        true
    }

    static var hasCryptoKit: Bool {
        // TODO
        false
    }

    static var isSwift6OrLater: Bool {
        // TODO
        false
    }

    static var isDebugBuild: Bool {
        // TODO
        false
    }

    static func supportsMacOS15APIs() -> Bool {
        // TODO
        false
    }
}
