import Testing
@testable import Challenges

@Suite("C11 · Generics")
struct C11_GenericsTests {
    @Test func stackIsLIFO() {
        var stack = Stack<String>()
        #expect(stack.isEmpty)
        stack.push("a")
        stack.push("b")
        stack.push("c")
        #expect(stack.count == 3)
        #expect(stack.peek() == "c")
        #expect(stack.pop() == "c")
        #expect(stack.pop() == "b")
        #expect(stack.count == 1)
        #expect(!stack.isEmpty)
    }

    @Test func popOnEmptyReturnsNil() {
        var stack = Stack<Int>()
        #expect(stack.pop() == nil)
        #expect(stack.peek() == nil)
    }

    @Test func indexFinding() {
        #expect(findIndex(of: 3, in: [1, 2, 3, 3]) == 2)
        #expect(findIndex(of: "z", in: ["a", "b"]) == nil)
    }

    @Test func occurrences() {
        #expect(countOccurrences(["a", "b", "a"]) == ["a": 2, "b": 1])
        #expect(countOccurrences([Int]()) == [:])
    }
}
