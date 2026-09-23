// ════════════════════════════════════════════════════════════════════════
//  Challenge 24 · self vs Self                                 Difficulty ★★☆
//  Interview question: "What is the difference between `self` and `Self`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `self` (lowercase) is the current instance (or the type itself, inside a
//  static method). `Self` (uppercase) is the current TYPE – and in a class it
//  means the *dynamic* type, so a subclass gets back its own type.
//
//  YOUR TASK
//  1. `Temperature` – use `Self` everywhere instead of writing `Temperature`:
//       • `freezing` (0 °C) and `boiling` (100 °C)
//       • `fahrenheit(_:)` – create from °F: (f - 32) × 5 / 9
//       • `warmer(by:)` – a copy that's `degrees` hotter
//  2. `Vehicle`
//       • `typeName()` – the name of the DYNAMIC type, e.g. "Bicycle" even
//         when called through a `Vehicle` variable. (`String(describing:)`)
//       • `fleet(of:)` – create `count` new instances of whatever type it's
//         called on: `Bicycle.fleet(of: 3)` must contain Bicycles, not plain
//         Vehicles. (Why can't a class method return `[Self]`? Try it!)
// ════════════════════════════════════════════════════════════════════════

struct Temperature: Equatable {
    var celsius: Double

    static var freezing: Self { Self(celsius: -1) } // TODO
    static var boiling: Self { Self(celsius: -1) } // TODO

    static func fahrenheit(_ value: Double) -> Self {
        // TODO
        Self(celsius: -1)
    }

    func warmer(by degrees: Double) -> Self {
        // TODO
        self
    }
}

class Vehicle {
    required init() {}

    func typeName() -> String {
        // TODO
        ""
    }

    static func fleet(of count: Int) -> [Vehicle] {
        // TODO
        []
    }
}

final class Bicycle: Vehicle {}
final class Truck: Vehicle {}
