// Solution · Challenge 32 · Float, Double, and CGFloat

import CoreGraphics

func isApproximatelyEqual(_ a: Double, _ b: Double, tolerance: Double = 1e-9) -> Bool {
    abs(a - b) <= tolerance * max(1, abs(a), abs(b))
}

func floatPrecisionLoss(_ value: Double) -> Double {
    value - Double(Float(value))
}

func scaledWidths(_ widths: [Double], by scale: CGFloat) -> [CGFloat] {
    widths.map { CGFloat($0) * scale }
}
