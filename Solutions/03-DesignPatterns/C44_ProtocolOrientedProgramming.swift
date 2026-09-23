// Solution · Challenge 44 · Protocol-Oriented Programming

protocol Animal {
    var name: String { get }
    var sound: String { get }
    // Declaring speak() as a requirement gives it dynamic dispatch, so
    // Parrot's version is used even through `any Animal`.
    func speak() -> String
}

protocol Flying {}
protocol Swimming {}

extension Animal {
    func speak() -> String {
        "\(name) says \(sound)"
    }

    var abilities: [String] {
        var result = ["walk"]
        if self is Flying { result.append("fly") }
        if self is Swimming { result.append("swim") }
        return result
    }
}

extension Animal where Self: Flying {
    func fly() -> String {
        "\(name) takes off!"
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
