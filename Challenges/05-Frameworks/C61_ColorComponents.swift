// ════════════════════════════════════════════════════════════════════════
//  Challenge 61 · Color Values Outside 0…1                     Difficulty ★★☆
//  Interview question: "What happens when `Color` or `UIColor` has values
//  outside 0 to 1?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Traditional sRGB components live in 0…1. Apple platforms support the
//  *extended* sRGB color space, where values below 0 or above 1 are kept and
//  describe colors outside the sRGB gamut – visible on wide-color (Display
//  P3) screens. On a standard display they're clamped when drawn. If you
//  need "safe" values (e.g. for a hex string), clamp them yourself.
//
//  YOUR TASK
//  1. `isExtendedRange` – true if any component is outside 0…1.
//  2. `clamped` – a copy with every component clamped into 0…1.
//  3. `hexString` – "#RRGGBB" (uppercase) from the CLAMPED color, each
//     channel rounded to the nearest 0–255 integer. Alpha is ignored.
//  4. `makeCGColor()` – a CGColor in the `extendedSRGB` color space that
//     preserves the ORIGINAL (unclamped) components.
// ════════════════════════════════════════════════════════════════════════

import CoreGraphics
import Foundation

struct RGBA: Equatable {
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double = 1

    var isExtendedRange: Bool {
        // TODO
        false
    }

    var clamped: RGBA {
        // TODO
        self
    }

    var hexString: String {
        // TODO
        ""
    }

    func makeCGColor() -> CGColor {
        // TODO
        CGColor(gray: 0, alpha: 1)
    }
}
