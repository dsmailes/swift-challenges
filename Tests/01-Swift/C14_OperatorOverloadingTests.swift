import Testing
@testable import Challenges

@Suite("C14 · Operator Overloading")
struct C14_OperatorOverloadingTests {
    let a = Vector2D(x: 1, y: 2)
    let b = Vector2D(x: 3, y: -1)

    @Test func addition() {
        #expect(a + b == Vector2D(x: 4, y: 1))
    }

    @Test func subtraction() {
        #expect(a - b == Vector2D(x: -2, y: 3))
    }

    @Test func scalarMultiplication() {
        #expect(a * 3 == Vector2D(x: 3, y: 6))
    }

    @Test func negation() {
        #expect(-a == Vector2D(x: -1, y: -2))
    }

    @Test func compoundAssignment() {
        var position = a
        position += b
        position += b
        #expect(position == Vector2D(x: 7, y: 0))
    }

    @Test func dotProduct() {
        #expect(a • b == 1)
        // Precedence: • binds like *, so this is (a • a) + 1
        #expect(a • a + 1 == 6)
    }
}
