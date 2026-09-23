// ════════════════════════════════════════════════════════════════════════
//  Challenge 31 · Strings Are Collections                      Difficulty ★★☆
//  Interview question: "What does it mean when we say 'strings are
//  collections in Swift'?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `String` conforms to `Collection` (actually `BidirectionalCollection`) of
//  `Character`, so you can loop over it, `map`, `filter`, `reversed()` etc.
//  A Character is a grapheme cluster – what a human sees as one character –
//  which may be made of several Unicode scalars and many UTF-8 bytes. That's
//  why you can't index a String with an Int.
//
//  YOUR TASK
//  1. `isPalindrome(_:)` – ignore case, and ignore anything that isn't a
//     letter or number. "A man, a plan, a canal: Panama!" → true
//  2. `reversedWords(_:)` – reverse the order of words (split on spaces).
//  3. `vowelCount(_:)` – count a, e, i, o, u (any case).
//  4. `lengths(of:)` – return the count of Characters, Unicode scalars,
//     and UTF-8 bytes. Try it with "👨‍👩‍👧" to see why these differ!
// ════════════════════════════════════════════════════════════════════════

func isPalindrome(_ text: String) -> Bool {
    // TODO
    false
}

func reversedWords(_ sentence: String) -> String {
    // TODO
    ""
}

func vowelCount(_ text: String) -> Int {
    // TODO
    0
}

func lengths(of text: String) -> (characters: Int, scalars: Int, utf8: Int) {
    // TODO
    (0, 0, 0)
}
