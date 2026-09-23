import Testing
@testable import Challenges

@Suite("C26 · Arrays vs Dictionaries")
struct C26_ArraysAndDictionariesTests {
    @Test func frequencies() {
        #expect(wordFrequencies(in: "The cat, the HAT!") == ["the": 2, "cat": 1, "hat": 1])
        #expect(wordFrequencies(in: "  ...  ") == [:])
    }

    @Test func mostFrequent() {
        #expect(mostFrequentWord(in: "b a b a c b") == "b")
        #expect(mostFrequentWord(in: "pear apple pear apple") == "apple")
        #expect(mostFrequentWord(in: "!!!") == nil)
    }

    @Test func grouping() {
        let groups = groupedByInitial(["alice", "Bob", "", "adam", "bella"])
        #expect(groups == ["A": ["alice", "adam"], "B": ["Bob", "bella"]])
    }
}
