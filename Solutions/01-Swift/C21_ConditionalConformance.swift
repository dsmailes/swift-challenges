// Solution · Challenge 21 · Conditional Conformances

protocol Summarizable {
    var summary: String { get }
}

struct Pair<T> {
    var first: T
    var second: T
}

extension Int: Summarizable {
    var summary: String { String(self) }
}

extension String: Summarizable {
    var summary: String { "\"\(self)\"" }
}

extension Array: Summarizable where Element: Summarizable {
    var summary: String {
        "[" + map(\.summary).joined(separator: ", ") + "]"
    }
}

extension Optional: Summarizable where Wrapped: Summarizable {
    var summary: String {
        self?.summary ?? "nothing"
    }
}

extension Pair: Equatable where T: Equatable {}
