import Testing
@testable import Challenges

@Suite("C01 · Nil Coalescing")
struct C01_NilCoalescingTests {
    @Test func prefersNickname() {
        #expect(displayName(nickname: "Tay", fullName: "Taylor Swift") == "Tay")
    }

    @Test func fallsBackToFullName() {
        #expect(displayName(nickname: nil, fullName: "Taylor Swift") == "Taylor Swift")
    }

    @Test func fallsBackToAnonymous() {
        #expect(displayName(nickname: nil, fullName: nil) == "Anonymous")
    }

    @Test func existingScore() {
        #expect(score(for: "Ada", in: ["Ada": 42]) == 42)
    }

    @Test func missingScoreIsZero() {
        #expect(score(for: "Grace", in: ["Ada": 42]) == 0)
    }

    @Test(arguments: [
        (["PORT": "3000"], 3000),
        ([:], 8080),
        (["PORT": "not-a-number"], 8080),
    ])
    func portParsing(environment: [String: String], expected: Int) {
        #expect(port(from: environment) == expected)
    }
}
