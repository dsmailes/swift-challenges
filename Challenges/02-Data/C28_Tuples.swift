// ════════════════════════════════════════════════════════════════════════
//  Challenge 28 · Tuples                                       Difficulty ★☆☆
//  Interview questions: "What are tuples and why are they useful?" and
//  "How would you compare two tuples to ensure their values are identical?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Tuples group a fixed number of values – optionally labeled – without
//  declaring a new type. They're great for returning multiple values. Swift
//  lets you compare tuples of up to 6 Equatable elements directly with `==`.
//
//  YOUR TASK
//  1. `minMax(of:)` – return both the smallest and largest values as a
//     labeled tuple, or nil for an empty array. Do it in ONE pass.
//  2. `swapped(_:)` – return the pair with its elements reversed.
//  3. `isSameLocation(_:_:)` – compare two coordinates using tuple `==`.
//  4. `splitName(_:)` – split a full name into first word and the rest
//     ("Mary Jane Watson" → first: "Mary", last: "Jane Watson"). A single
//     word gives an empty last name.
// ════════════════════════════════════════════════════════════════════════

func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    // TODO
    nil
}

func swapped<A, B>(_ pair: (A, B)) -> (B, A) {
    // TODO
    (pair.1, pair.0) // ← this one's a freebie. Try writing it with destructuring: let (a, b) = pair
}

func isSameLocation(_ a: (lat: Double, lon: Double), _ b: (lat: Double, lon: Double)) -> Bool {
    // TODO
    false
}

func splitName(_ fullName: String) -> (first: String, last: String) {
    // TODO
    ("", "")
}
