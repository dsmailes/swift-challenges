import Testing
@testable import Challenges

@Suite("C40 · Type Erasure")
struct C40_TypeErasureTests {
    let usernameRules: [AnyValidator<String>] = [
        AnyValidator(NonEmptyValidator()),
        AnyValidator(LengthValidator(range: 3...12)),
        AnyValidator(NoSpacesValidator()),
    ]

    @Test func wrapsBehavior() {
        let validator = AnyValidator(RangeValidator(range: 1...10))
        #expect(validator.validate(5))
        #expect(!validator.validate(11))
        #expect(validator.name == "range")
    }

    @Test func mixedValidators() {
        #expect(allPass(usernameRules, input: "swiftie"))
        #expect(!allPass(usernameRules, input: "no way"))
    }

    @Test func reportsFailures() {
        #expect(failing(usernameRules, input: "") == ["non-empty", "length"])
        #expect(failing(usernameRules, input: "a very long name") == ["length", "no-spaces"])
        #expect(failing(usernameRules, input: "fine") == [])
    }
}
