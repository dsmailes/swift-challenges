// ════════════════════════════════════════════════════════════════════════
//  Challenge 30 · One-Sided Ranges                             Difficulty ★☆☆
//  Interview question: "What are one-sided ranges and when would you use
//  them?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `5...` means "5 and everything after"; `..<5` and `...5` mean "everything
//  before / up to 5". They're great in `switch` statements and for slicing
//  collections: `array[2...]`, `array[..<3]`.
//
//  YOUR TASK
//  1. `letterGrade(for:)` – use a switch with one-sided ranges:
//       90...  → "A",  80..<90 → "B",  70..<80 → "C",  60..<70 → "D",
//       ..<60 → "F"
//  2. `firstItems(_:count:)` – up to `count` items from the start using a
//     `..<` slice. Must not crash if count exceeds the array length.
//  3. `items(_:from:)` – everything from `index` onwards using a `...` slice.
//     Return [] if the index is past the end.
// ════════════════════════════════════════════════════════════════════════

func letterGrade(for score: Int) -> String {
    // TODO
    ""
}

func firstItems<T>(_ items: [T], count: Int) -> [T] {
    // TODO
    []
}

func items<T>(_ items: [T], from index: Int) -> [T] {
    // TODO
    []
}
