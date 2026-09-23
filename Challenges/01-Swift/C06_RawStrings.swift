// ════════════════════════════════════════════════════════════════════════
//  Challenge 06 · Raw Strings                                  Difficulty ★☆☆
//  Interview question: "What are raw strings?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Wrapping a string in `#"…"#` makes backslashes and quote marks literal, so
//  you don't need to escape them. To interpolate inside a raw string you use
//  `\#(value)` – the number of #s must match the delimiter.
//
//  YOUR TASK
//  Use raw strings (no `\\` or `\"` escapes!) to:
//  1. Set `windowsPath` to: C:\Users\Taylor\Documents
//  2. Set `digitsPattern` to the regex: \d+
//  3. Make `sayingQuote(_:)` return:  He said "<text>"
//     e.g. sayingQuote("hi") → He said "hi"
//  4. Make `containsDigits(_:)` use `digitsPattern` with
//     `range(of:options: .regularExpression)`.
// ════════════════════════════════════════════════════════════════════════

import Foundation

let windowsPath = "" // TODO

let digitsPattern = "" // TODO

func sayingQuote(_ text: String) -> String {
    // TODO
    return ""
}

func containsDigits(_ text: String) -> Bool {
    // TODO
    return false
}
