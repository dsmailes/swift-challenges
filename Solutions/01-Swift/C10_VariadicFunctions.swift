// Solution · Challenge 10 · Variadic Functions

func average(_ numbers: Double...) -> Double? {
    guard !numbers.isEmpty else { return nil }
    return numbers.reduce(0, +) / Double(numbers.count)
}

func joinedPath(_ components: String...) -> String {
    components.filter { !$0.isEmpty }.joined(separator: "/")
}

func largest<T: Comparable>(_ first: T, _ rest: T...) -> T {
    rest.reduce(first) { max($0, $1) }
}
