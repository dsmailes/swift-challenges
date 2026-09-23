import Testing
@testable import Challenges

@Suite("C18 · @autoclosure")
struct C18_AutoclosureTests {
    final class CallCounter {
        var calls = 0
        func expensive(_ text: String) -> String {
            calls += 1
            return text
        }
    }

    @Test func logsWhenEnabled() {
        let logger = DebugLogger(isEnabled: true)
        let counter = CallCounter()
        logger.log(counter.expensive("hello"))
        #expect(logger.messages == ["hello"])
        #expect(counter.calls == 1)
    }

    @Test func skipsEvaluationWhenDisabled() {
        let logger = DebugLogger(isEnabled: false)
        let counter = CallCounter()
        logger.log(counter.expensive("hello"))
        #expect(logger.messages.isEmpty)
        #expect(counter.calls == 0)
    }

    @Test func fallbackOnlyWhenNeeded() {
        let counter = CallCounter()
        #expect(valueOrDefault("real", counter.expensive("fallback")) == "real")
        #expect(counter.calls == 0)
        #expect(valueOrDefault(nil, counter.expensive("fallback")) == "fallback")
        #expect(counter.calls == 1)
    }
}
