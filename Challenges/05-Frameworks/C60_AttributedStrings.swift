// ════════════════════════════════════════════════════════════════════════
//  Challenge 60 · Attributed Strings                           Difficulty ★★☆
//  Interview question: "What experience do you have of `NSAttributedString`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  An attributed string is text plus attributes (font, color, links, custom
//  keys…) attached to ranges. `NSMutableAttributedString.addAttribute(_:
//  value:range:)` applies them; `enumerateAttribute(_:in:)` reads them back.
//  Ranges are `NSRange`s in UTF-16 units – use `NSString` methods or
//  `NSRange(_:in:)` to convert safely. (Swift's `AttributedString` is the
//  modern value-type alternative.)
//
//  YOUR TASK
//  1. `highlighting(_:in:)` – add the custom `.highlight` attribute (value
//     `true`) to EVERY case-insensitive occurrence of `keyword`.
//  2. `linkifyingMentions(in:)` – find every "@username" (letters, digits,
//     underscore) and add a `.link` attribute whose value is the URL
//     https://example.com/users/<username> covering the whole "@username".
//  3. `highlightedFragments(in:)` – return the substrings that carry the
//     `.highlight` attribute, in order.
// ════════════════════════════════════════════════════════════════════════

import Foundation

extension NSAttributedString.Key {
    static let highlight = NSAttributedString.Key("SwiftChallenges.highlight")
}

func highlighting(_ keyword: String, in text: String) -> NSAttributedString {
    // TODO
    NSAttributedString(string: text)
}

func linkifyingMentions(in text: String) -> NSAttributedString {
    // TODO
    NSAttributedString(string: text)
}

func highlightedFragments(in attributed: NSAttributedString) -> [String] {
    // TODO
    []
}
