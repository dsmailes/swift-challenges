import Testing
@testable import Challenges

@Suite("C27 · Arrays vs Sets")
struct C27_ArraysAndSetsTests {
    @Test func dedupeKeepsOrder() {
        #expect(removingDuplicates([3, 1, 3, 2, 1]) == [3, 1, 2])
        #expect(removingDuplicates(Array("mississippi")) == Array("misp"))
    }

    @Test func mutual() {
        #expect(mutualFollowers(["ana", "ben", "cai"], ["cai", "dee", "ana", "ana"]) == ["ana", "cai"])
    }

    @Test func duplicates() {
        #expect(hasDuplicates([1, 2, 1]))
        #expect(!hasDuplicates(["a", "b"]))
        #expect(!hasDuplicates([Int]()))
    }

    @Test func missing() {
        #expect(missingNumbers(in: [5, 1, 3], expected: 1...6) == [2, 4, 6])
        #expect(missingNumbers(in: [1, 2, 3], expected: 1...3) == [])
    }
}
