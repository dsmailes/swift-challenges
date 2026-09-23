// ════════════════════════════════════════════════════════════════════════
//  Challenge 48 · Phantom Types                                Difficulty ★★★
//  Interview question: "What are phantom types and when would you use them?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A phantom type is a generic parameter that's never used for storage – it
//  exists only to make the compiler treat otherwise-identical values as
//  different types. `Length<Meters>` and `Length<Feet>` both just hold a
//  Double, but you can't accidentally add one to the other.
//  (The Mars Climate Orbiter was lost to exactly this kind of unit mix-up!)
//
//  YOUR TASK
//  1. `+` – add two lengths of the SAME unit.
//  2. `inFeet` on `Length<Meters>` and `inMeters` on `Length<Feet>` –
//     convert using 1 ft = 0.3048 m.
//  3. `totalDistance(_:)` – sum a route made of metric legs.
//
//  Try writing `Length<Meters>(value: 1) + Length<Feet>(value: 1)` – it
//  shouldn't compile!
// ════════════════════════════════════════════════════════════════════════

enum Meters {}
enum Feet {}

struct Length<Unit>: Equatable {
    let value: Double

    static func + (lhs: Length<Unit>, rhs: Length<Unit>) -> Length<Unit> {
        // TODO
        Length(value: 0)
    }
}

extension Length where Unit == Meters {
    var inFeet: Length<Feet> {
        // TODO
        Length<Feet>(value: 0)
    }
}

extension Length where Unit == Feet {
    var inMeters: Length<Meters> {
        // TODO
        Length<Meters>(value: 0)
    }
}

func totalDistance(_ legs: [Length<Meters>]) -> Length<Meters> {
    // TODO
    Length(value: 0)
}
