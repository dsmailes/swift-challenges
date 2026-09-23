import Testing
@testable import Challenges

@Suite("C10 · Variadic Functions")
struct C10_VariadicFunctionsTests {
    @Test func averages() {
        #expect(average(2, 4, 6) == 4)
        #expect(average(5) == 5)
        #expect(average() == nil)
    }

    @Test func paths() {
        #expect(joinedPath("users", "", "taylor") == "users/taylor")
        #expect(joinedPath("a", "b", "c") == "a/b/c")
        #expect(joinedPath() == "")
    }

    @Test func largestValue() {
        #expect(largest(3, 9, 2) == 9)
        #expect(largest(42) == 42)
        #expect(largest("apple", "pear", "fig") == "pear")
    }
}
