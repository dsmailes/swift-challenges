// Solution · Challenge 14 · Operator Overloading

infix operator •: MultiplicationPrecedence

struct Vector2D: Equatable {
    var x: Double
    var y: Double

    static let zero = Vector2D(x: 0, y: 0)

    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        Vector2D(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    static func - (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        lhs + -rhs
    }

    static func * (vector: Vector2D, scalar: Double) -> Vector2D {
        Vector2D(x: vector.x * scalar, y: vector.y * scalar)
    }

    static prefix func - (vector: Vector2D) -> Vector2D {
        Vector2D(x: -vector.x, y: -vector.y)
    }

    static func += (lhs: inout Vector2D, rhs: Vector2D) {
        lhs = lhs + rhs
    }

    static func • (lhs: Vector2D, rhs: Vector2D) -> Double {
        lhs.x * rhs.x + lhs.y * rhs.y
    }
}
