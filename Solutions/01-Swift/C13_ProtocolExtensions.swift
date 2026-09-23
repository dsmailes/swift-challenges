// Solution · Challenge 13 · Extensions vs Protocol Extensions

extension Int {
    var isEven: Bool {
        isMultiple(of: 2)
    }

    func times(_ action: () -> Void) {
        guard self > 0 else { return }
        for _ in 0..<self {
            action()
        }
    }
}

extension Collection where Element: BinaryInteger {
    var total: Element {
        reduce(0, +)
    }

    var mean: Double? {
        guard !isEmpty else { return nil }
        return Double(total) / Double(count)
    }
}

extension Sequence where Element: Hashable {
    var isAllUnique: Bool {
        var seen = Set<Element>()
        for element in self {
            if !seen.insert(element).inserted { return false }
        }
        return true
    }
}
