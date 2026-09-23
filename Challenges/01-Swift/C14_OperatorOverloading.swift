// ════════════════════════════════════════════════════════════════════════
//  Challenge 14 · Operator Overloading                         Difficulty ★★☆
//  Interview question: "How would you explain operator overloading to a
//  junior developer?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Swift lets you implement existing operators (+, -, *, ==, …) for your own
//  types as static functions, and even declare brand-new operators. Use it
//  when the meaning is obvious – vectors adding together is a classic example.
//
//  YOUR TASK
//  Implement these operators for `Vector2D`:
//    • `+` and `-`      – component-wise addition / subtraction
//    • `*`              – multiply a vector by a scalar (vector * Double)
//    • prefix `-`       – negate both components
//    • `+=`             – add in place
//    • `•` (custom)     – the dot product: a.x * b.x + a.y * b.y
//  The custom operator is already declared for you below. (Type • with
//  ⌥-8 on a Mac keyboard.)
// ════════════════════════════════════════════════════════════════════════

infix operator •: MultiplicationPrecedence

struct Vector2D: Equatable {
    var x: Double
    var y: Double

    static let zero = Vector2D(x: 0, y: 0)

    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        // TODO
        .zero
    }

    static func - (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        // TODO
        .zero
    }

    static func * (vector: Vector2D, scalar: Double) -> Vector2D {
        // TODO
        .zero
    }

    static prefix func - (vector: Vector2D) -> Vector2D {
        // TODO
        .zero
    }

    static func += (lhs: inout Vector2D, rhs: Vector2D) {
        // TODO
    }

    static func • (lhs: Vector2D, rhs: Vector2D) -> Double {
        // TODO
        0
    }
}
