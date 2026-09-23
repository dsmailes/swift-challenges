import Testing
@testable import Challenges

@Suite("C09 · Closures")
struct C09_ClosuresTests {
    @Test func counterCounts() {
        let counter = makeCounter(startingAt: 10, step: 5)
        #expect(counter() == 10)
        #expect(counter() == 15)
        #expect(counter() == 20)
    }

    @Test func countersAreIndependent() {
        let a = makeCounter()
        let b = makeCounter()
        _ = a(); _ = a()
        #expect(a() == 2)
        #expect(b() == 0)
    }

    @Test func applyTwiceWorks() {
        #expect(applyTwice({ $0 * 3 }, to: 2) == 18)
        #expect(applyTwice({ $0 + "!" }, to: "Hi") == "Hi!!")
    }

    @Test func sortingByLength() {
        #expect(sortedByLength(["pear", "fig", "apple", "kiwi", "date"]) == ["fig", "date", "kiwi", "pear", "apple"])
    }
}
