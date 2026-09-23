import Testing
@testable import Challenges

@Suite("C17 · Escaping vs Non-Escaping Closures")
struct C17_EscapingClosuresTests {
    @Test func tasksRunLaterInOrder() {
        let queue = TaskQueue()
        var output: [Int] = []
        queue.enqueue { output.append(1) }
        queue.enqueue { output.append(2) }
        #expect(output.isEmpty)
        #expect(queue.pendingCount == 2)

        queue.runAll()
        #expect(output == [1, 2])
        #expect(queue.pendingCount == 0)
    }

    @Test func tasksAddedDuringRunWait() {
        let queue = TaskQueue()
        var output: [String] = []
        queue.enqueue {
            output.append("first")
            queue.enqueue { output.append("later") }
        }
        queue.runAll()
        #expect(output == ["first"])
        #expect(queue.pendingCount == 1)
        queue.runAll()
        #expect(output == ["first", "later"])
    }

    @Test func measureRunsImmediately() {
        let measured = measure { 6 * 7 }
        #expect(measured.result == 42)
        #expect(measured.calls == 1)
    }
}
