import Testing
@testable import Challenges

@Suite("C16 · defer")
struct C16_DeferTests {
    @Test func successfulProcessing() throws {
        let log = EventLog()
        let count = try processFile(named: "notes.txt", contents: "Hello", log: log)
        #expect(count == 5)
        #expect(log.entries == ["open notes.txt", "read 5 chars", "close notes.txt"])
    }

    @Test func closesEvenWhenThrowing() {
        let log = EventLog()
        #expect(throws: FileProcessingError.self) {
            try processFile(named: "empty.txt", contents: "", log: log)
        }
        #expect(log.entries == ["open empty.txt", "close empty.txt"])
    }

    @Test func defersRunInReverse() {
        let log = EventLog()
        runSteps(log: log)
        #expect(log.entries == ["start", "work", "cleanup 2", "cleanup 1"])
    }
}
