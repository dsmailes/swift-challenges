// ════════════════════════════════════════════════════════════════════════
//  Challenge 09 · Closures                                     Difficulty ★★☆
//  Interview questions: "How would you explain closures to a new Swift
//  developer?" and "In which situations do Swift functions not need a
//  `return` keyword?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A closure is a chunk of code you can pass around and call later. Closures
//  *capture* the values they use from their surrounding scope, so a closure
//  can keep state alive after the function that created it has returned.
//  Single-expression closures and functions can omit `return`.
//
//  YOUR TASK
//  1. `makeCounter(startingAt:step:)` – return a closure that yields
//     `startingAt` the first time it's called, then increases by `step` on each
//     later call. Each counter must keep its own independent state.
//  2. `applyTwice(_:to:)` – call `transform` on the value, then call it
//     again on the result.
//  3. `sortedByLength(_:)` – sort shortest-first; words of equal length should
//     be in alphabetical order. Use a single-expression closure with no
//     `return` keyword.
// ════════════════════════════════════════════════════════════════════════

func makeCounter(startingAt start: Int = 0, step: Int = 1) -> () -> Int {
    // TODO
    return { 0 }
}

func applyTwice<T>(_ transform: (T) -> T, to value: T) -> T {
    // TODO
    value
}

func sortedByLength(_ words: [String]) -> [String] {
    // TODO
    words
}
