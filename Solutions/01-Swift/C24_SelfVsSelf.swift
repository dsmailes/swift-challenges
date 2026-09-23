// Solution · Challenge 24 · self vs Self

struct Temperature: Equatable {
    var celsius: Double

    static var freezing: Self { Self(celsius: 0) }
    static var boiling: Self { Self(celsius: 100) }

    static func fahrenheit(_ value: Double) -> Self {
        Self(celsius: (value - 32) * 5 / 9)
    }

    func warmer(by degrees: Double) -> Self {
        Self(celsius: celsius + degrees)
    }
}

class Vehicle {
    required init() {}

    func typeName() -> String {
        String(describing: Self.self)
    }

    // Classes can't return `[Self]` (covariant Self only works at the top
    // level of a return type), but `Self()` still builds the dynamic type.
    static func fleet(of count: Int) -> [Vehicle] {
        (0..<count).map { _ in Self() }
    }
}

final class Bicycle: Vehicle {}
final class Truck: Vehicle {}
