// Solution · Challenge 03 · if let vs guard let

import Foundation

struct SignupForm: Equatable {
    let username: String
    let age: Int
}

func greeting(for name: String?) -> String {
    if let name {
        return "Hello, \(name)!"
    } else {
        return "Hello, stranger!"
    }
}

func makeSignupForm(from fields: [String: String]) -> SignupForm? {
    guard let rawUsername = fields["username"] else { return nil }

    let username = rawUsername.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !username.isEmpty else { return nil }

    guard let rawAge = fields["age"], let age = Int(rawAge) else { return nil }
    guard age >= 13 else { return nil }

    return SignupForm(username: username, age: age)
}
