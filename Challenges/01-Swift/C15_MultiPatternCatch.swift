// ════════════════════════════════════════════════════════════════════════
//  Challenge 15 · Multi-Pattern Catch Clauses                  Difficulty ★★☆
//  Interview question: "What are multi-pattern catch clauses?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A single `catch` can match several error patterns separated by commas,
//  e.g. `catch NetworkFailure.unauthorized, NetworkFailure.forbidden`.
//  Patterns can also bind associated values and use `where` clauses.
//
//  YOUR TASK
//  Implement `recoveryAction(for:)`. Run `operation`; if it succeeds return
//  nil. Otherwise map the error to a `RecoveryAction`:
//    • `.timeout`, or `.serverError` with a code in 500...599 → `.retry`
//    • `.noConnection`                                        → `.showOfflineBanner`
//    • `.unauthorized` or `.forbidden`                        → `.signIn`
//    • anything else (other server codes, other error types) → `.reportBug`
//  Use multi-pattern catch clauses rather than a switch inside one catch.
// ════════════════════════════════════════════════════════════════════════

enum NetworkFailure: Error {
    case timeout
    case noConnection
    case unauthorized
    case forbidden
    case serverError(code: Int)
}

enum RecoveryAction: Equatable {
    case retry
    case showOfflineBanner
    case signIn
    case reportBug
}

func recoveryAction(for operation: () throws -> Void) -> RecoveryAction? {
    // TODO
    nil
}
