// Solution · Challenge 61 · Color Values Outside 0…1

import CoreGraphics
import Foundation

struct RGBA: Equatable {
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double = 1

    private var components: [Double] { [red, green, blue, alpha] }

    var isExtendedRange: Bool {
        components.contains { !(0...1).contains($0) }
    }

    var clamped: RGBA {
        func clamp(_ value: Double) -> Double { min(max(value, 0), 1) }
        return RGBA(red: clamp(red), green: clamp(green), blue: clamp(blue), alpha: clamp(alpha))
    }

    var hexString: String {
        let safe = clamped
        let channels = [safe.red, safe.green, safe.blue].map { Int(($0 * 255).rounded()) }
        return "#" + channels.map { String(format: "%02X", $0) }.joined()
    }

    func makeCGColor() -> CGColor {
        let space = CGColorSpace(name: CGColorSpace.extendedSRGB)!
        let values = components.map { CGFloat($0) }
        return CGColor(colorSpace: space, components: values)!
    }
}
