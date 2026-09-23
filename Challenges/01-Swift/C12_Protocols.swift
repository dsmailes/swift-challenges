// ════════════════════════════════════════════════════════════════════════
//  Challenge 12 · Protocols                                    Difficulty ★☆☆
//  Interview question: "How would you explain protocols to a new Swift
//  developer?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A protocol describes what a type can do without saying how. Any struct,
//  class, or enum can conform, and code can work with "any value that
//  conforms" (`any GeometricShape`) without knowing the concrete type.
//
//  YOUR TASK
//  1. Implement `area()` and `perimeter()` for `CircleShape`,
//     `RectangleShape`, and `SquareShape`. (Use `Double.pi`.)
//  2. `totalArea(of:)` – the combined area of all the shapes.
//  3. `largestShape(in:)` – the shape with the biggest area, or nil if the
//     array is empty.
// ════════════════════════════════════════════════════════════════════════

protocol GeometricShape {
    var name: String { get }
    func area() -> Double
    func perimeter() -> Double
}

struct CircleShape: GeometricShape {
    let name = "Circle"
    var radius: Double

    func area() -> Double { 0 } // TODO
    func perimeter() -> Double { 0 } // TODO
}

struct RectangleShape: GeometricShape {
    let name = "Rectangle"
    var width: Double
    var height: Double

    func area() -> Double { 0 } // TODO
    func perimeter() -> Double { 0 } // TODO
}

struct SquareShape: GeometricShape {
    let name = "Square"
    var side: Double

    func area() -> Double { 0 } // TODO
    func perimeter() -> Double { 0 } // TODO
}

func totalArea(of shapes: [any GeometricShape]) -> Double {
    // TODO
    0
}

func largestShape(in shapes: [any GeometricShape]) -> (any GeometricShape)? {
    // TODO
    nil
}
