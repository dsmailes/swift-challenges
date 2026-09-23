// ════════════════════════════════════════════════════════════════════════
//  Challenge 10 · Variadic Functions                           Difficulty ★☆☆
//  Interview question: "What is a variadic function?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A variadic parameter (`Int...`) accepts zero or more values, which arrive
//  inside the function as an array. A useful trick: pair a normal parameter
//  with a variadic one to require *at least one* value.
//
//  YOUR TASK
//  1. `average(_:)` – the mean of the numbers, or nil if none were passed.
//  2. `joinedPath(_:)` – join the components with "/", skipping any empty
//     strings. e.g. joinedPath("users", "", "taylor") → "users/taylor"
//  3. `largest(_:_:)` – the largest of one or more comparable values.
// ════════════════════════════════════════════════════════════════════════

func average(_ numbers: Double...) -> Double? {
    // TODO
    nil
}

func joinedPath(_ components: String...) -> String {
    // TODO
    ""
}

func largest<T: Comparable>(_ first: T, _ rest: T...) -> T {
    // TODO
    first
}
