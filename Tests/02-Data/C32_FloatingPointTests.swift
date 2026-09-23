import CoreGraphics
import Testing
@testable import Challenges

@Suite("C32 · Float, Double, and CGFloat")
struct C32_FloatingPointTests {
    @Test func naiveEqualityFails() {
        // This is why the challenge exists:
        #expect(0.1 + 0.2 != 0.3)
    }

    @Test func approximateEquality() {
        #expect(isApproximatelyEqual(0.1 + 0.2, 0.3))
        #expect(isApproximatelyEqual(1e20 + 1e5, 1e20))
        #expect(!isApproximatelyEqual(1.0, 1.001))
    }

    @Test func precisionLoss() {
        #expect(floatPrecisionLoss(0.5) == 0)
        #expect(floatPrecisionLoss(0.1) != 0)
        #expect(abs(floatPrecisionLoss(0.1)) < 1e-8)
    }

    @Test func cgFloats() {
        #expect(scaledWidths([10, 2.5], by: 2) == [20, 5])
    }
}
