// Solution · Challenge 42 · MVVM

import Observation

@Observable
final class SignUpViewModel {
    enum Messages {
        static let invalidEmail = "Please enter a valid email address."
        static let passwordTooShort = "Password must be at least 8 characters."
        static let passwordsDontMatch = "Passwords don't match."
    }

    var email = ""
    var password = ""
    var confirmation = ""
    var isSubmitting = false

    var emailError: String? {
        guard !email.isEmpty else { return nil }
        guard let at = email.firstIndex(of: "@"),
              at != email.startIndex,
              email[email.index(after: at)...].contains(".")
        else { return Messages.invalidEmail }
        return nil
    }

    var passwordError: String? {
        guard !password.isEmpty else { return nil }
        return password.count < 8 ? Messages.passwordTooShort : nil
    }

    var confirmationError: String? {
        guard !confirmation.isEmpty else { return nil }
        return confirmation != password ? Messages.passwordsDontMatch : nil
    }

    var canSubmit: Bool {
        let allFilled = ![email, password, confirmation].contains(where: \.isEmpty)
        let noErrors = [emailError, passwordError, confirmationError].allSatisfy { $0 == nil }
        return allFilled && noErrors && !isSubmitting
    }

    var submitButtonTitle: String {
        isSubmitting ? "Creating account…" : "Sign Up"
    }
}
