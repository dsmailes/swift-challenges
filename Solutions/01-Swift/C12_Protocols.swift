// Solution · Challenge 12 · Protocols

protocol GeometricShape {
    var name: String { get }
    func area() -> Double
    func perimeter() -> Double
}

struct CircleShape: GeometricShape {
    let name = "Circle"
    var radius: Double

    func area() -> Double { .pi * radius * radius }
    func perimeter() -> Double { 2 * .pi * radius }
}

struct RectangleShape: GeometricShape {
    let name = "Rectangle"
    var width: Double
    var height: Double

    func area() -> Double { width * height }
    func perimeter() -> Double { 2 * (width + height) }
}

struct SquareShape: GeometricShape {
    let name = "Square"
    var side: Double

    func area() -> Double { side * side }
    func perimeter() -> Double { 4 * side }
}

func totalArea(of shapes: [any GeometricShape]) -> Double {
    shapes.reduce(0) { $0 + $1.area() }
}

func largestShape(in shapes: [any GeometricShape]) -> (any GeometricShape)? {
    shapes.max { $0.area() < $1.area() }
}
