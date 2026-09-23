// ════════════════════════════════════════════════════════════════════════
//  Challenge 42 · MVVM                                         Difficulty ★★☆
//  Interview questions: "Can you explain MVVM, and how it might be used on
//  Apple's platforms?" and "Can you explain MVC, and how it's used on Apple's
//  platforms?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  In MVVM the View Model owns presentation logic: it turns raw model state
//  into exactly what the view should display (error messages, enabled
//  states, button titles). Views stay dumb and the logic becomes unit
//  testable without any UI – which is exactly what these tests do.
//  (In classic Apple MVC this logic tends to pile up in view controllers.)
//
//  YOUR TASK
//  Implement the computed properties of `SignUpViewModel`:
//  • `emailError` – nil while email is empty; otherwise
//    `Messages.invalidEmail` unless the email contains "@" with at least one
//    character before it, and a "." somewhere after it.
//  • `passwordError` – nil while password is empty; otherwise
//    `Messages.passwordTooShort` if fewer than 8 characters.
//  • `confirmationError` – nil while confirmation is empty; otherwise
//    `Messages.passwordsDontMatch` if it differs from password.
//  • `canSubmit` – true only when all three fields are non-empty and there
//    are no errors, and we're not already submitting.
//  • `submitButtonTitle` – "Creating account…" while `isSubmitting`,
//    otherwise "Sign Up".
//
//  BONUS: add `@Observable` to the class and build a SwiftUI form for it.
// ════════════════════════════════════════════════════════════════════════

import Observation

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
        // TODO
        nil
    }

    var passwordError: String? {
        // TODO
        nil
    }

    var confirmationError: String? {
        // TODO
        nil
    }

    var canSubmit: Bool {
        // TODO
        false
    }

    var submitButtonTitle: String {
        // TODO
        ""
    }
}
