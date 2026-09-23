// ════════════════════════════════════════════════════════════════════════
//  Challenge 19 · Key Paths                                    Difficulty ★★☆
//  Interview question: "How would you explain key paths to a new Swift
//  developer?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A key path (`\Song.plays`) is a reference to a property that you can store
//  and pass around, then use later to read that property from any instance:
//  `song[keyPath: path]`. Key paths can also be used where a function
//  `(Root) -> Value` is expected: `songs.map(\.title)`.
//
//  YOUR TASK
//  Write generic helpers that accept key paths:
//  1. `sorted(on:ascending:)` on Sequence – sort elements by any Comparable
//     property.
//  2. `pluck(_:)` on Sequence – extract one property from every element.
//  3. `sum(of:in:)` – add up an Int property across an array.
// ════════════════════════════════════════════════════════════════════════

struct Song {
    var title: String
    var artist: String
    var plays: Int
}

extension Sequence {
    func sorted<Value: Comparable>(on keyPath: KeyPath<Element, Value>, ascending: Bool = true) -> [Element] {
        // TODO
        Array(self)
    }

    func pluck<Value>(_ keyPath: KeyPath<Element, Value>) -> [Value] {
        // TODO
        []
    }
}

func sum<T>(of keyPath: KeyPath<T, Int>, in items: [T]) -> Int {
    // TODO
    0
}
