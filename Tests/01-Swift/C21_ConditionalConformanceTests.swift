import Testing
@testable import Challenges

/// Checks conformance at runtime so these tests compile before you've written
/// any conformances.
private func summary(of value: Any) -> String? {
    (value as? any Summarizable)?.summary
}

private func isEqual(_ a: Any, _ b: Any) -> Bool? {
    guard let a = a as? any Equatable else { return nil }
    return a.isEqual(to: b)
}

private extension Equatable {
    func isEqual(to other: Any) -> Bool {
        (other as? Self) == self
    }
}

@Suite("C21 · Conditional Conformances")
struct C21_ConditionalConformanceTests {
    final class NotEquatable {}

    @Test func basicSummaries() {
        #expect(summary(of: 42) == "42")
        #expect(summary(of: "hi") == "\"hi\"")
    }

    @Test func arraysOfSummarizable() {
        #expect(summary(of: [1, 2]) == "[1, 2]")
        #expect(summary(of: [["a"], ["b", "c"]]) == "[[\"a\"], [\"b\", \"c\"]]")
    }

    @Test func arraysOfOtherThingsAreNotSummarizable() {
        #expect(summary(of: [1.5, 2.5]) == nil)
    }

    @Test func optionals() {
        #expect(summary(of: Optional(5) as Any) == "5")
        #expect(summary(of: Optional<Int>.none as Any) == "nothing")
    }

    @Test func pairEquality() {
        #expect(isEqual(Pair(first: 1, second: 2), Pair(first: 1, second: 2)) == true)
        #expect(isEqual(Pair(first: 1, second: 2), Pair(first: 2, second: 1)) == false)
    }

    @Test func pairOfNonEquatableIsNotEquatable() {
        let pair = Pair(first: NotEquatable(), second: NotEquatable())
        #expect(isEqual(pair, pair) == nil)
    }
}
