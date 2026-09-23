// ════════════════════════════════════════════════════════════════════════
//  Challenge 32 · Float, Double, and CGFloat                   Difficulty ★★☆
//  Interview question: "What is the difference between the `Float`,
//  `Double`, and `CGFloat` data types?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `Float` is a 32-bit floating-point number (~7 significant digits);
//  `Double` is 64-bit (~15 digits) and is Swift's default. `CGFloat` is used
//  by Core Graphics and is 64-bit on all modern platforms. None of them can
//  store 0.1 exactly, so `0.1 + 0.2 == 0.3` is false – never compare
//  floating-point values with `==` after arithmetic.
//
//  YOUR TASK
//  1. `isApproximatelyEqual(_:_:tolerance:)` – true when
//     |a − b| ≤ tolerance × max(1, |a|, |b|). This is a combined absolute and
//     relative tolerance, so it works for both tiny and huge numbers.
//  2. `floatPrecisionLoss(_:)` – how much a Double changes when converted to
//     Float and back: `value − Double(Float(value))`.
//  3. `scaledWidths(_:by:)` – convert an array of Doubles to CGFloats and
//     multiply each by the scale factor.
// ════════════════════════════════════════════════════════════════════════

import CoreGraphics

func isApproximatelyEqual(_ a: Double, _ b: Double, tolerance: Double = 1e-9) -> Bool {
    // TODO
    a == b
}

func floatPrecisionLoss(_ value: Double) -> Double {
    // TODO
    -1
}

func scaledWidths(_ widths: [Double], by scale: CGFloat) -> [CGFloat] {
    // TODO
    []
}
