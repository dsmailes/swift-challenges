// ════════════════════════════════════════════════════════════════════════
//  Challenge 04 · try, try?, and try!                          Difficulty ★☆☆
//  Interview question: "What is the difference between `try`, `try?`, and
//  `try!` in Swift?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  • `try`  – propagate the error to the caller (inside `do/catch` or a
//             throwing function).
//  • `try?` – convert any error into nil and carry on.
//  • `try!` – assert that no error will happen; crash if one does. Only use it
//             when failure is genuinely impossible (e.g. hard-coded input).
//
//  YOUR TASK
//  1. `requireValue(_:in:)` – return the value for `key`, or throw
//     `ConfigError.missingValue(key)`.
//  2. `requireInt(_:in:)` – use `try` with `requireValue`, then convert to
//     Int, throwing `ConfigError.invalidNumber(key)` if conversion fails.
//  3. `optionalInt(_:in:)` – use `try?` with `requireInt` so any failure
//     becomes nil.
//  4. `timeout(in:)` – return the "timeout" setting, or 30 if it's missing or
//     invalid. (Hint: `try?` pairs nicely with `??`.)
//  5. `defaultRetryCount()` – call `requireInt("retries", in: ["retries": "3"])`
//     with `try!`. It's safe here because the input is hard-coded.
// ════════════════════════════════════════════════════════════════════════

enum ConfigError: Error, Equatable {
    case missingValue(String)
    case invalidNumber(String)
}

func requireValue(_ key: String, in config: [String: String]) throws -> String {
    // TODO
    return ""
}

func requireInt(_ key: String, in config: [String: String]) throws -> Int {
    // TODO
    return 0
}

func optionalInt(_ key: String, in config: [String: String]) -> Int? {
    // TODO
    return nil
}

func timeout(in config: [String: String]) -> Int {
    // TODO
    return 0
}

func defaultRetryCount() -> Int {
    // TODO
    return 0
}
