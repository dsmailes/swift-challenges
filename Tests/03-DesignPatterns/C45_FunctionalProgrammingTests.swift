import Testing
@testable import Challenges

@Suite("C45 · Functional Programming")
struct C45_FunctionalProgrammingTests {
    @Test func composition() {
        let double: (Double) -> Double = { $0 * 2 }
        let addOne: (Double) -> Double = { $0 + 1 }
        #expect(compose(double, addOne)(5) == 11)
        #expect(compose(addOne, double)(5) == 12)
    }

    @Test func currying() {
        let addTen = curriedAdd(10)
        #expect(addTen(5) == 15)
        #expect(curriedAdd(2)(3) == 5)
    }

    @Test func totals() {
        let lines = [
            OrderLine(name: "Coffee", price: 3.5, quantity: 2),
            OrderLine(name: "Bagel", price: 2, quantity: 3),
        ]
        #expect(orderTotal(lines) == 13)
        #expect(orderTotal([]) == 0)
    }

    @Test func scorers() {
        let scores = ["Ann": 90, "Bob": 75, "Cat": 90, "Dan": 60]
        #expect(topScorers(scores, count: 3) == ["Ann", "Cat", "Bob"])
        #expect(topScorers(scores, count: 10).count == 4)
    }
}
