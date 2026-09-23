import Testing
@testable import Challenges

@Suite("C04 · try, try?, and try!")
struct C04_TryVariantsTests {
    @Test func requireValueReturnsValue() throws {
        #expect(try requireValue("name", in: ["name": "app"]) == "app")
    }

    @Test func requireValueThrowsWhenMissing() {
        #expect(throws: ConfigError.missingValue("name")) {
            try requireValue("name", in: [:])
        }
    }

    @Test func requireIntParses() throws {
        #expect(try requireInt("n", in: ["n": "42"]) == 42)
    }

    @Test func requireIntPropagatesMissing() {
        #expect(throws: ConfigError.missingValue("n")) {
            try requireInt("n", in: [:])
        }
    }

    @Test func requireIntThrowsWhenInvalid() {
        #expect(throws: ConfigError.invalidNumber("n")) {
            try requireInt("n", in: ["n": "forty-two"])
        }
    }

    @Test func optionalIntSwallowsErrors() {
        #expect(optionalInt("n", in: ["n": "7"]) == 7)
        #expect(optionalInt("n", in: ["n": "seven"]) == nil)
        #expect(optionalInt("n", in: [:]) == nil)
    }

    @Test func timeoutDefaults() {
        #expect(timeout(in: ["timeout": "10"]) == 10)
        #expect(timeout(in: ["timeout": "soon"]) == 30)
        #expect(timeout(in: [:]) == 30)
    }

    @Test func retryCount() {
        #expect(defaultRetryCount() == 3)
    }
}
