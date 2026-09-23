import Testing
@testable import Challenges

@Suite("C15 · Multi-Pattern Catch Clauses")
struct C15_MultiPatternCatchTests {
    struct OtherError: Error {}

    @Test func successReturnsNil() {
        #expect(recoveryAction { } == nil)
    }

    @Test(arguments: [
        (NetworkFailure.timeout, RecoveryAction.retry),
        (.serverError(code: 503), .retry),
        (.serverError(code: 404), .reportBug),
        (.noConnection, .showOfflineBanner),
        (.unauthorized, .signIn),
        (.forbidden, .signIn),
    ])
    func mapping(failure: NetworkFailure, expected: RecoveryAction) {
        #expect(recoveryAction { throw failure } == expected)
    }

    @Test func unknownErrorsAreBugs() {
        #expect(recoveryAction { throw OtherError() } == .reportBug)
    }
}
