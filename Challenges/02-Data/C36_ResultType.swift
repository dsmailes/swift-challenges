// ════════════════════════════════════════════════════════════════════════
//  Challenge 36 · The Result Type                              Difficulty ★★☆
//  Interview question: "When would you use Swift's `Result` type?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `Result<Success, Failure>` stores EITHER a success value OR an error. It's
//  handy when you need to store or pass around the outcome of work – e.g. in
//  completion handlers, or when collecting many outcomes – rather than
//  throwing immediately. Use `.get()` to convert back to throwing code, and
//  `map` / `flatMap` to transform it.
//
//  YOUR TASK
//  1. `validatePassword(_:)` – check the rules in this order and fail with the
//     FIRST one that's broken:
//       • at least 8 characters          → .tooShort
//       • contains at least one digit     → .missingNumber
//       • contains an uppercase letter    → .missingUppercase
//     Succeed with the password itself.
//  2. `requireValidPassword(_:)` – a throwing wrapper using `.get()`.
//  3. `passwordLength(_:)` – use `.map` to turn a successful validation into
//     the password's length.
//  4. `failureCounts(_:)` – given many results, count how often each error
//     occurred.
// ════════════════════════════════════════════════════════════════════════

enum PasswordError: Error, Equatable, Hashable {
    case tooShort
    case missingNumber
    case missingUppercase
}

func validatePassword(_ password: String) -> Result<String, PasswordError> {
    // TODO
    .failure(.missingUppercase)
}

func requireValidPassword(_ password: String) throws(PasswordError) -> String {
    // TODO
    ""
}

func passwordLength(_ password: String) -> Result<Int, PasswordError> {
    // TODO
    .success(0)
}

func failureCounts(_ results: [Result<String, PasswordError>]) -> [PasswordError: Int] {
    // TODO
    [:]
}
