// Solution · Challenge 11 · Generics

struct Stack<Element> {
    private var storage: [Element] = []

    mutating func push(_ element: Element) {
        storage.append(element)
    }

    mutating func pop() -> Element? {
        storage.popLast()
    }

    func peek() -> Element? {
        storage.last
    }

    var count: Int {
        storage.count
    }

    var isEmpty: Bool {
        storage.isEmpty
    }
}

func findIndex<T: Equatable>(of target: T, in items: [T]) -> Int? {
    for (index, item) in items.enumerated() where item == target {
        return index
    }
    return nil
}

func countOccurrences<T: Hashable>(_ items: [T]) -> [T: Int] {
    items.reduce(into: [:]) { counts, item in
        counts[item, default: 0] += 1
    }
}
