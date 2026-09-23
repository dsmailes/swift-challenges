// Solution · Challenge 36 · The Result Type

enum PasswordError: Error, Equatable, Hashable {
    case tooShort
    case missingNumber
    case missingUppercase
}

func validatePassword(_ password: String) -> Result<String, PasswordError> {
    guard password.count >= 8 else { return .failure(.tooShort) }
    guard password.contains(where: \.isNumber) else { return .failure(.missingNumber) }
    guard password.contains(where: \.isUppercase) else { return .failure(.missingUppercase) }
    return .success(password)
}

func requireValidPassword(_ password: String) throws(PasswordError) -> String {
    try validatePassword(password).get()
}

func passwordLength(_ password: String) -> Result<Int, PasswordError> {
    validatePassword(password).map(\.count)
}

func failureCounts(_ results: [Result<String, PasswordError>]) -> [PasswordError: Int] {
    var counts: [PasswordError: Int] = [:]
    for case .failure(let error) in results {
        counts[error, default: 0] += 1
    }
    return counts
}
