import Testing
@testable import Challenges

@Suite("C12 · Protocols")
struct C12_ProtocolsTests {
    @Test func circle() {
        let circle = CircleShape(radius: 2)
        #expect(abs(circle.area() - 12.566370614359172) < 1e-9)
        #expect(abs(circle.perimeter() - 12.566370614359172) < 1e-9)
    }

    @Test func rectangleAndSquare() {
        #expect(RectangleShape(width: 3, height: 4).area() == 12)
        #expect(RectangleShape(width: 3, height: 4).perimeter() == 14)
        #expect(SquareShape(side: 5).area() == 25)
        #expect(SquareShape(side: 5).perimeter() == 20)
    }

    @Test func totals() {
        let shapes: [any GeometricShape] = [SquareShape(side: 2), RectangleShape(width: 1, height: 3)]
        #expect(totalArea(of: shapes) == 7)
    }

    @Test func largest() {
        let shapes: [any GeometricShape] = [SquareShape(side: 2), CircleShape(radius: 2), RectangleShape(width: 10, height: 1)]
        #expect(largestShape(in: shapes)?.name == "Circle")
        #expect(largestShape(in: []) == nil)
    }
}
