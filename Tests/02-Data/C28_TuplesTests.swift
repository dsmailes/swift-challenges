import Testing
@testable import Challenges

@Suite("C28 · Tuples")
struct C28_TuplesTests {
    @Test func minAndMax() {
        let result = minMax(of: [4, -2, 9, 0])
        #expect(result?.min == -2)
        #expect(result?.max == 9)
        #expect(minMax(of: []) == nil)
    }

    @Test func swapping() {
        let result = swapped((1, "one"))
        #expect(result == ("one", 1))
    }

    @Test func locations() {
        #expect(isSameLocation((51.5, -0.12), (51.5, -0.12)))
        #expect(!isSameLocation((51.5, -0.12), (48.8, 2.35)))
    }

    @Test func names() {
        #expect(splitName("Mary Jane Watson") == ("Mary", "Jane Watson"))
        #expect(splitName("Cher") == ("Cher", ""))
    }
}
