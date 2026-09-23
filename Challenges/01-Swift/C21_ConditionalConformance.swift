// ════════════════════════════════════════════════════════════════════════
//  Challenge 21 · Conditional Conformances                     Difficulty ★★★
//  Interview question: "What are conditional conformances?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A generic type can conform to a protocol only when its generic parameters
//  meet certain requirements, e.g. `extension Array: Equatable where
//  Element: Equatable`. That's why `[Int]` is Equatable but `[SomeClass]`
//  isn't, unless SomeClass is.
//
//  YOUR TASK
//  This file intentionally contains NO conformances yet – write them all.
//  (The tests check conformance at runtime, so they compile either way.)
//
//  1. Make `Int` and `String` conform to `Summarizable`:
//        42.summary     → "42"
//        "hi".summary   → "\"hi\""   (wrapped in double quotes)
//  2. Make `Array` conform to `Summarizable` **only when** its elements do:
//        [1, 2].summary → "[1, 2]"
//  3. Make `Optional` conform **only when** `Wrapped` does:
//        Optional(5).summary → "5",   nil → "nothing"
//  4. Make `Pair` conform to `Equatable` **only when** `T` is Equatable.
//     Pair<SomethingNotEquatable> must NOT be Equatable.
// ════════════════════════════════════════════════════════════════════════

protocol Summarizable {
    var summary: String { get }
}

struct Pair<T> {
    var first: T
    var second: T
}

// TODO: write your extensions here.
