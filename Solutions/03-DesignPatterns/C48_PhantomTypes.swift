// Solution · Challenge 48 · Phantom Types

enum Meters {}
enum Feet {}

struct Length<Unit>: Equatable {
    let value: Double

    static func + (lhs: Length<Unit>, rhs: Length<Unit>) -> Length<Unit> {
        Length(value: lhs.value + rhs.value)
    }
}

private let metersPerFoot = 0.3048

extension Length where Unit == Meters {
    var inFeet: Length<Feet> {
        Length<Feet>(value: value / metersPerFoot)
    }
}

extension Length where Unit == Feet {
    var inMeters: Length<Meters> {
        Length<Meters>(value: value * metersPerFoot)
    }
}

func totalDistance(_ legs: [Length<Meters>]) -> Length<Meters> {
    legs.reduce(Length(value: 0), +)
}
