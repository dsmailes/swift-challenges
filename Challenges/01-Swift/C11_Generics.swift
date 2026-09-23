// ════════════════════════════════════════════════════════════════════════
//  Challenge 11 · Generics                                     Difficulty ★★☆
//  Interview question: "What are generics and why are they useful?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Generics let you write one implementation that works with many types while
//  keeping full type safety. Constraints such as `T: Equatable` describe what
//  the generic type must be able to do.
//
//  YOUR TASK
//  1. Finish `Stack<Element>` – a last-in, first-out collection:
//       • `push(_:)` adds an element to the top
//       • `pop()` removes and returns the top element (nil if empty)
//       • `peek()` returns the top element without removing it
//       • `count` and `isEmpty`
//  2. `findIndex(of:in:)` – return the index of the first matching element,
//     without using `firstIndex(of:)`.
//  3. `countOccurrences(_:)` – return how many times each element appears.
//     Which constraint does the element need?
// ════════════════════════════════════════════════════════════════════════

struct Stack<Element> {
    private var storage: [Element] = []

    mutating func push(_ element: Element) {
        // TODO
    }

    mutating func pop() -> Element? {
        // TODO
        nil
    }

    func peek() -> Element? {
        // TODO
        nil
    }

    var count: Int {
        // TODO
        0
    }

    var isEmpty: Bool {
        // TODO
        false
    }
}

func findIndex<T: Equatable>(of target: T, in items: [T]) -> Int? {
    // TODO
    nil
}

func countOccurrences<T: Hashable>(_ items: [T]) -> [T: Int] {
    // TODO
    [:]
}
