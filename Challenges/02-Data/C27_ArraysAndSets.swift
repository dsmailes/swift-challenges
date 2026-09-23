// ════════════════════════════════════════════════════════════════════════
//  Challenge 27 · Arrays vs Sets                               Difficulty ★☆☆
//  Interview question: "What is the difference between an array and a set?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Arrays keep order and allow duplicates; `contains()` is O(n). Sets are
//  unordered, store each element once, and `contains()` is O(1) – plus they
//  have handy set algebra: union, intersection, subtracting, etc.
//
//  YOUR TASK
//  1. `removingDuplicates(_:)` – remove duplicates but KEEP the original order
//     of first appearances. Use a Set to track what you've seen.
//  2. `mutualFollowers(_:_:)` – names that appear in both lists.
//  3. `hasDuplicates(_:)` – true if any element appears more than once.
//  4. `missingNumbers(in:expected:)` – numbers in the range that are absent
//     from the array, sorted ascending.
// ════════════════════════════════════════════════════════════════════════

func removingDuplicates<T: Hashable>(_ items: [T]) -> [T] {
    // TODO
    items
}

func mutualFollowers(_ first: [String], _ second: [String]) -> Set<String> {
    // TODO
    []
}

func hasDuplicates<T: Hashable>(_ items: [T]) -> Bool {
    // TODO
    false
}

func missingNumbers(in numbers: [Int], expected range: ClosedRange<Int>) -> [Int] {
    // TODO
    []
}
