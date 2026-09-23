// Solution · Challenge 15 · Multi-Pattern Catch Clauses

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
    do {
        try operation()
        return nil
    } catch NetworkFailure.timeout, NetworkFailure.serverError(code: 500...599) {
        return .retry
    } catch NetworkFailure.noConnection {
        return .showOfflineBanner
    } catch NetworkFailure.unauthorized, NetworkFailure.forbidden {
        return .signIn
    } catch {
        return .reportBug
    }
}
