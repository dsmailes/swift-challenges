import Testing
@testable import Challenges

@Suite("C30 · One-Sided Ranges")
struct C30_OneSidedRangesTests {
    @Test(arguments: [(100, "A"), (90, "A"), (89, "B"), (75, "C"), (60, "D"), (59, "F"), (-3, "F")])
    func grades(score: Int, expected: String) {
        #expect(letterGrade(for: score) == expected)
    }

    @Test func prefixes() {
        #expect(firstItems([1, 2, 3, 4], count: 2) == [1, 2])
        #expect(firstItems([1, 2], count: 10) == [1, 2])
        #expect(firstItems([1, 2], count: 0) == [])
    }

    @Test func suffixes() {
        #expect(items(["a", "b", "c"], from: 1) == ["b", "c"])
        #expect(items(["a", "b", "c"], from: 3) == [])
        #expect(items(["a", "b", "c"], from: 99) == [])
    }
}
