// ════════════════════════════════════════════════════════════════════════
//  Challenge 45 · Functional Programming                       Difficulty ★★☆
//  Interview question: "What experience do you have of functional
//  programming?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Functional programming favors pure functions (same input → same output,
//  no side effects), immutable data, and building behavior by combining
//  functions: map/filter/reduce, function composition, and currying.
//
//  YOUR TASK (no `for` / `while` loops and no `var`!)
//  1. `compose(_:_:)` – return a function that applies `f`, then `g`.
//  2. `curriedAdd(_:)` – return a function that adds `a` to its input, so
//     `curriedAdd(2)(3) == 5`.
//  3. `orderTotal(_:)` – sum price × quantity for every line.
//  4. `topScorers(_:count:)` – names of the highest scorers, best first; ties
//     sorted alphabetically.
//
//  BONUS: make `compose` and `curry` fully generic.
// ════════════════════════════════════════════════════════════════════════

struct OrderLine {
    let name: String
    let price: Double
    let quantity: Int
}

func compose(_ f: @escaping (Double) -> Double, _ g: @escaping (Double) -> Double) -> (Double) -> Double {
    // TODO
    f
}

func curriedAdd(_ a: Int) -> (Int) -> Int {
    // TODO
    { $0 }
}

func orderTotal(_ lines: [OrderLine]) -> Double {
    // TODO
    0
}

func topScorers(_ scores: [String: Int], count: Int) -> [String] {
    // TODO
    []
}
