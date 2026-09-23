// ════════════════════════════════════════════════════════════════════════
//  Challenge 18 · @autoclosure                                 Difficulty ★★☆
//  Interview question: "When would you use `@autoclosure`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `@autoclosure` wraps an argument expression in a closure automatically, so
//  the caller writes `log(expensiveString())` but the expression is only
//  evaluated if – and when – the function calls it. `??`, `&&`, `assert()`
//  all use this to avoid doing unnecessary work.
//
//  YOUR TASK
//  1. `DebugLogger.log(_:)` – only evaluate the message (and append it to
//     `messages`) when `isEnabled` is true. When disabled the message
//     expression must NOT be evaluated at all.
//  2. `valueOrDefault(_:_:)` – your own version of `??`: return the value if
//     non-nil, otherwise evaluate the fallback. The fallback must only be
//     evaluated when needed.
// ════════════════════════════════════════════════════════════════════════

final class DebugLogger {
    var isEnabled: Bool
    private(set) var messages: [String] = []

    init(isEnabled: Bool) {
        self.isEnabled = isEnabled
    }

    func log(_ message: @autoclosure () -> String) {
        // TODO
    }
}

func valueOrDefault<T>(_ value: T?, _ fallback: @autoclosure () -> T) -> T {
    // TODO
    fallback()
}
