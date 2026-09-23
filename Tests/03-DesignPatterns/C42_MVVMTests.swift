import Testing
@testable import Challenges

@Suite("C42 · MVVM")
struct C42_MVVMTests {
    typealias Messages = SignUpViewModel.Messages

    @Test func emptyFormShowsNoErrorsButCantSubmit() {
        let viewModel = SignUpViewModel()
        #expect(viewModel.emailError == nil)
        #expect(viewModel.passwordError == nil)
        #expect(viewModel.confirmationError == nil)
        #expect(!viewModel.canSubmit)
        #expect(viewModel.submitButtonTitle == "Sign Up")
    }

    @Test(arguments: ["taylor", "@example.com", "taylor@example", "taylor.swift@"])
    func invalidEmails(email: String) {
        let viewModel = SignUpViewModel()
        viewModel.email = email
        #expect(viewModel.emailError == Messages.invalidEmail)
    }

    @Test func validEmail() {
        let viewModel = SignUpViewModel()
        viewModel.email = "taylor@example.com"
        #expect(viewModel.emailError == nil)
    }

    @Test func passwordRules() {
        let viewModel = SignUpViewModel()
        viewModel.password = "short"
        viewModel.confirmation = "different"
        #expect(viewModel.passwordError == Messages.passwordTooShort)
        #expect(viewModel.confirmationError == Messages.passwordsDontMatch)
    }

    @Test func validFormCanSubmit() {
        let viewModel = SignUpViewModel()
        viewModel.email = "taylor@example.com"
        viewModel.password = "correct horse"
        viewModel.confirmation = "correct horse"
        #expect(viewModel.canSubmit)

        viewModel.isSubmitting = true
        #expect(!viewModel.canSubmit)
        #expect(viewModel.submitButtonTitle == "Creating account…")
    }
}
