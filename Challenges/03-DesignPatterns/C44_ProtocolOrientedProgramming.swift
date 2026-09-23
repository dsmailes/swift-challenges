// ════════════════════════════════════════════════════════════════════════
//  Challenge 44 · Protocol-Oriented Programming                Difficulty ★★★
//  Interview question: "How would you explain protocol-oriented programming
//  to a new Swift developer?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  POP builds behavior by composing small protocols with default
//  implementations (in protocol extensions), rather than inheriting from a
//  big base class. It works for structs and enums as well as classes.
//
//  One famous gotcha: a method that exists ONLY in a protocol extension is
//  statically dispatched. If a conforming type "overrides" it, calls made
//  through the protocol type (e.g. `any Animal`) still use the extension's
//  version. Declaring the method as a protocol REQUIREMENT fixes that.
//
//  YOUR TASK
//  1. Default `speak()` in the `Animal` extension: "<name> says <sound>".
//  2. `abilities` – ["walk"] plus "fly" if the animal conforms to `Flying`
//     and "swim" if it conforms to `Swimming`, in that order.
//  3. `fly()` – a method available ONLY on animals that are `Flying`,
//     returning "<name> takes off!" (constrained extension).
//  4. `Parrot` has its own `speak()`. Make sure it's used even when the
//     parrot is stored as `any Animal`.
// ════════════════════════════════════════════════════════════════════════

protocol Animal {
    var name: String { get }
    var sound: String { get }
}

protocol Flying {}
protocol Swimming {}

extension Animal {
    func speak() -> String {
        // TODO
        ""
    }

    var abilities: [String] {
        // TODO
        []
    }
}

extension Animal where Self: Flying {
    func fly() -> String {
        // TODO
        ""
    }
}

struct Duck: Animal, Flying, Swimming {
    let name = "Duck"
    let sound = "quack"
}

struct Penguin: Animal, Swimming {
    let name = "Penguin"
    let sound = "squawk"
}

struct Dog: Animal {
    let name = "Dog"
    let sound = "woof"
}

struct Parrot: Animal, Flying {
    let name = "Parrot"
    let sound = "squawk"

    func speak() -> String {
        "Polly wants a cracker!"
    }
}
