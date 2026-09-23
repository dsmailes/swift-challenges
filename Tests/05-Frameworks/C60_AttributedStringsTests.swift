import Foundation
import Testing
@testable import Challenges

@Suite("C60 · Attributed Strings")
struct C60_AttributedStringsTests {
    @Test func highlightsAllOccurrences() {
        let result = highlighting("swift", in: "Swift is swift. SWIFT!")
        var range = NSRange()
        #expect(result.attribute(.highlight, at: 0, effectiveRange: &range) as? Bool == true)
        #expect(range == NSRange(location: 0, length: 5))
        #expect(result.attribute(.highlight, at: 6, effectiveRange: nil) == nil)
        #expect(highlightedFragments(in: result) == ["Swift", "swift", "SWIFT"])
    }

    @Test func fragmentsFromManualAttributes() {
        let text = NSMutableAttributedString(string: "one two three")
        text.addAttribute(.highlight, value: true, range: NSRange(location: 4, length: 3))
        #expect(highlightedFragments(in: text) == ["two"])
    }

    @Test func mentions() {
        let result = linkifyingMentions(in: "Hi @ada and @grace_h!")
        var range = NSRange()
        let link = result.attribute(.link, at: 4, effectiveRange: &range) as? URL
        #expect(link?.absoluteString == "https://example.com/users/ada")
        #expect(range == NSRange(location: 3, length: 4))

        let second = result.attribute(.link, at: 13, effectiveRange: &range) as? URL
        #expect(second?.absoluteString == "https://example.com/users/grace_h")
        #expect(range == NSRange(location: 12, length: 8))

        #expect(result.attribute(.link, at: 0, effectiveRange: nil) == nil)
    }

    @Test func emojiSafeRanges() {
        let result = highlighting("cat", in: "🐱 cat")
        #expect(highlightedFragments(in: result) == ["cat"])
    }
}
