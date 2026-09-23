// Solution · Challenge 30 · One-Sided Ranges

func letterGrade(for score: Int) -> String {
    switch score {
    case 90...: "A"
    case 80..<90: "B"
    case 70..<80: "C"
    case 60..<70: "D"
    case ..<60: "F"
    default: "F" // The compiler can't prove the ranges above are exhaustive.
    }
}

func firstItems<T>(_ items: [T], count: Int) -> [T] {
    Array(items[..<min(max(count, 0), items.count)])
}

func items<T>(_ items: [T], from index: Int) -> [T] {
    guard index < items.count else { return [] }
    return Array(items[max(index, 0)...])
}
