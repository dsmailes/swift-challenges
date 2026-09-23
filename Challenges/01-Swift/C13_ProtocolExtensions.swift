// ════════════════════════════════════════════════════════════════════════
//  Challenge 13 · Extensions vs Protocol Extensions            Difficulty ★★☆
//  Interview question: "What is the difference between an extension and a
//  protocol extension?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  An extension adds functionality to ONE concrete type (e.g. `Int`).
//  A protocol extension adds functionality to EVERY type that conforms to a
//  protocol – and `where` clauses let you target only conforming types that
//  meet extra constraints.
//
//  YOUR TASK
//  1. Extension on `Int`:
//       • `isEven`
//       • `times(_:)` – run the closure `self` times (do nothing if ≤ 0)
//  2. Protocol extension on `Collection where Element: BinaryInteger`
//     (works for [Int], Set<UInt8>, ArraySlice<Int64>…):
//       • `total` – the sum of the elements
//       • `mean` – the average as a Double, or nil if empty
//  3. Protocol extension on `Sequence where Element: Hashable`:
//       • `isAllUnique` – true if no element appears twice
// ════════════════════════════════════════════════════════════════════════

extension Int {
    var isEven: Bool {
        // TODO
        false
    }

    func times(_ action: () -> Void) {
        // TODO
    }
}

extension Collection where Element: BinaryInteger {
    var total: Element {
        // TODO
        0
    }

    var mean: Double? {
        // TODO
        nil
    }
}

extension Sequence where Element: Hashable {
    var isAllUnique: Bool {
        // TODO
        false
    }
}
