// Solution · Challenge 40 · Type Erasure

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
    private let _validate: (Input) -> Bool

    init<V: Validator>(_ validator: V) where V.Input == Input {
        name = validator.name
        _validate = validator.validate
    }

    func validate(_ input: Input) -> Bool {
        _validate(input)
    }
}

func allPass<T>(_ validators: [AnyValidator<T>], input: T) -> Bool {
    validators.allSatisfy { $0.validate(input) }
}

func failing<T>(_ validators: [AnyValidator<T>], input: T) -> [String] {
    validators.filter { !$0.validate(input) }.map(\.name)
}
