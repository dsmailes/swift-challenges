// ════════════════════════════════════════════════════════════════════════
//  Challenge 40 · Type Erasure                                 Difficulty ★★★
//  Interview question: "What is type erasure and when would you use it?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Protocols with associated types (like `Validator` below) can't simply be
//  mixed in an array – `[NonEmptyValidator, LengthValidator]` are different
//  types. A type eraser (`AnyValidator<Input>`) wraps ANY validator with a
//  given Input type and hides the concrete type, exposing just the behavior.
//  Apple uses this pattern for `AnyPublisher`, `AnyView`, `AnyHashable`…
//  (Modern Swift can often use `any Validator<String>` instead – but erasers
//  are still common and a classic interview topic.)
//
//  YOUR TASK
//  1. Implement `AnyValidator`: store the wrapped validator's `validate`
//     function in a closure property, and call it from `validate(_:)`.
//  2. `allPass(_:input:)` – true if every validator accepts the input.
//  3. `failing(_:input:)` – the `name`s of the validators that reject it.
// ════════════════════════════════════════════════════════════════════════

protocol Validator {
    associatedtype Input
    var name: String { get }
    func validate(_ input: Input) -> Bool
}

struct NonEmptyValidator: Validator {
    let name = "non-empty"
    func validate(_ input: String) -> Bool { !input.isEmpty }
}

struct LengthValidator: Validator {
    let name = "length"
    let range: ClosedRange<Int>
    func validate(_ input: String) -> Bool { range.contains(input.count) }
}

struct NoSpacesValidator: Validator {
    let name = "no-spaces"
    func validate(_ input: String) -> Bool { !input.contains(" ") }
}

struct RangeValidator: Validator {
    let name = "range"
    let range: ClosedRange<Int>
    func validate(_ input: Int) -> Bool { range.contains(input) }
}

struct AnyValidator<Input>: Validator {
    let name: String
    // TODO: store the wrapped validation logic

    init<V: Validator>(_ validator: V) where V.Input == Input {
        name = validator.name
        // TODO
    }

    func validate(_ input: Input) -> Bool {
        // TODO
        false
    }
}

func allPass<T>(_ validators: [AnyValidator<T>], input: T) -> Bool {
    // TODO
    false
}

func failing<T>(_ validators: [AnyValidator<T>], input: T) -> [String] {
    // TODO
    []
}
