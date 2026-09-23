import Testing
@testable import Challenges

@Suite("C36 · The Result Type")
struct C36_ResultTypeTests {
    @Test(arguments: [
        ("short1A", Result<String, PasswordError>.failure(.tooShort)),
        ("longenough", .failure(.missingNumber)),
        ("longenough1", .failure(.missingUppercase)),
        ("LongEnough1", .success("LongEnough1")),
    ])
    func validation(password: String, expected: Result<String, PasswordError>) {
        #expect(validatePassword(password) == expected)
    }

    @Test func throwingWrapper() throws {
        #expect(try requireValidPassword("Swift2024!") == "Swift2024!")
        #expect(throws: PasswordError.tooShort) {
            try requireValidPassword("abc")
        }
    }

    @Test func mapping() {
        #expect(passwordLength("Swift2024!") == .success(10))
        #expect(passwordLength("abc") == .failure(.tooShort))
    }

    @Test func counting() {
        let results = ["a", "b", "longenough", "Valid1234", "c"].map(validatePassword)
        #expect(failureCounts(results) == [.tooShort: 3, .missingNumber: 1])
    }
}
