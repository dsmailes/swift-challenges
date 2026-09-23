// ════════════════════════════════════════════════════════════════════════
//  Challenge 03 · if let vs guard let                          Difficulty ★☆☆
//  Interview questions: "What is the difference between `if let` and
//  `guard let`?" and "When would you use the `guard` keyword in Swift?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `if let` unwraps an optional for use *inside* its braces. `guard let`
//  unwraps it for the *rest of the scope*, and forces you to exit early
//  (return / throw / break / continue) when unwrapping fails. `guard` keeps
//  the "happy path" unindented and makes preconditions obvious.
//
//  YOUR TASK
//  1. `greeting(for:)` – use `if let`. Return "Hello, <name>!" if a name is
//     provided, otherwise "Hello, stranger!".
//
//  2. `makeSignupForm(from:)` – use a series of `guard` statements to build a
//     `SignupForm` from raw text fields. Return nil unless ALL of these hold:
//       • "username" exists and is non-empty after trimming whitespace
//         (store the trimmed version)
//       • "age" exists and converts to an Int
//       • the age is 13 or over
// ════════════════════════════════════════════════════════════════════════

import Foundation

struct SignupForm: Equatable {
    let username: String
    let age: Int
}

func greeting(for name: String?) -> String {
    // TODO: use if let
    return ""
}

func makeSignupForm(from fields: [String: String]) -> SignupForm? {
    // TODO: use guard
    return nil
}
