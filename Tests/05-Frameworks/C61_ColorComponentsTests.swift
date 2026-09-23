import CoreGraphics
import Testing
@testable import Challenges

@Suite("C61 · Color Values Outside 0…1")
struct C61_ColorComponentsTests {
    let vivid = RGBA(red: 1.2, green: 0.5, blue: -0.1)

    @Test func detectsExtendedRange() {
        #expect(vivid.isExtendedRange)
        #expect(!RGBA(red: 0, green: 0.5, blue: 1).isExtendedRange)
        #expect(RGBA(red: 0, green: 0, blue: 0, alpha: 1.5).isExtendedRange)
    }

    @Test func clamping() {
        #expect(vivid.clamped == RGBA(red: 1, green: 0.5, blue: 0))
    }

    @Test func hex() {
        #expect(vivid.hexString == "#FF8000")
        #expect(RGBA(red: 0, green: 0, blue: 0).hexString == "#000000")
        #expect(RGBA(red: 0.2, green: 0.4, blue: 0.6).hexString == "#336699")
    }

    @Test func extendedCGColorKeepsValues() throws {
        let color = vivid.makeCGColor()
        #expect(color.colorSpace?.name == CGColorSpace.extendedSRGB)
        let components = try #require(color.components)
        try #require(components.count == 4)
        #expect(abs(components[0] - 1.2) < 1e-6)
        #expect(abs(components[2] - -0.1) < 1e-6)
    }
}
