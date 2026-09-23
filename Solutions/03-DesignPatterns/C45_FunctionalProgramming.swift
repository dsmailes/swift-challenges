// Solution · Challenge 45 · Functional Programming

struct OrderLine {
    let name: String
    let price: Double
    let quantity: Int
}

func compose(_ f: @escaping (Double) -> Double, _ g: @escaping (Double) -> Double) -> (Double) -> Double {
    { g(f($0)) }
}

func curriedAdd(_ a: Int) -> (Int) -> Int {
    { b in a + b }
}

func orderTotal(_ lines: [OrderLine]) -> Double {
    lines.map { $0.price * Double($0.quantity) }.reduce(0, +)
}

func topScorers(_ scores: [String: Int], count: Int) -> [String] {
    scores
        .sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }
        .prefix(count)
        .map(\.key)
}

// Bonus: generic versions.
func compose<A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    { g(f($0)) }
}

func curry<A, B, C>(_ function: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    { a in { b in function(a, b) } }
}
