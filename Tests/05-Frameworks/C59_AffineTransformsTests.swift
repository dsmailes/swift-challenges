import CoreGraphics
import Testing
@testable import Challenges

@Suite("C59 · CGAffineTransform")
struct C59_AffineTransformsTests {
    func isClose(_ a: CGPoint, _ b: CGPoint) -> Bool {
        abs(a.x - b.x) < 1e-9 && abs(a.y - b.y) < 1e-9
    }

    @Test func orderMatters() {
        let point = CGPoint(x: 1, y: 1).applying(scaleThenTranslate(scale: 2, tx: 10, ty: 0))
        #expect(isClose(point, CGPoint(x: 12, y: 2)))
    }

    @Test func rotating() {
        #expect(isClose(CGPoint(x: 1, y: 0).applying(rotation(degrees: 90)), CGPoint(x: 0, y: 1)))
        #expect(isClose(CGPoint(x: 1, y: 0).applying(rotation(degrees: 180)), CGPoint(x: -1, y: 0)))
    }

    @Test func flipping() {
        let flip = flipVertically(height: 100)
        #expect(isClose(CGPoint(x: 5, y: 0).applying(flip), CGPoint(x: 5, y: 100)))
        #expect(isClose(CGPoint(x: 5, y: 30).applying(flip), CGPoint(x: 5, y: 70)))
    }

    @Test func manyPoints() {
        let result = transformed([.zero, CGPoint(x: 1, y: 2)], by: CGAffineTransform(translationX: 3, y: 4))
        #expect(result == [CGPoint(x: 3, y: 4), CGPoint(x: 4, y: 6)])
    }
}
