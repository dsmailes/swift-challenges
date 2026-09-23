import Testing
@testable import Challenges

@Suite("C03 · if let vs guard let")
struct C03_IfLetGuardLetTests {
    @Test func greetings() {
        #expect(greeting(for: "Sam") == "Hello, Sam!")
        #expect(greeting(for: nil) == "Hello, stranger!")
    }

    @Test func validForm() {
        let form = makeSignupForm(from: ["username": "  swiftie  ", "age": "21"])
        #expect(form == SignupForm(username: "swiftie", age: 21))
    }

    @Test func exactlyThirteenIsAllowed() {
        #expect(makeSignupForm(from: ["username": "teen", "age": "13"]) != nil)
    }

    @Test(arguments: [
        [:],
        ["age": "30"],
        ["username": "   ", "age": "30"],
        ["username": "sam"],
        ["username": "sam", "age": "thirty"],
        ["username": "sam", "age": "12"],
    ])
    func invalidForms(fields: [String: String]) {
        #expect(makeSignupForm(from: fields) == nil)
    }
}
