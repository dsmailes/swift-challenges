// ════════════════════════════════════════════════════════════════════════
//  Challenge 26 · Arrays vs Dictionaries                       Difficulty ★☆☆
//  Interview question: "How is a dictionary different from an array?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Arrays are ordered and accessed by integer position. Dictionaries are
//  unordered and accessed by a Hashable key, with fast lookup, and reading a
//  key always returns an optional because the key may be missing.
//
//  YOUR TASK
//  1. `wordFrequencies(in:)` – count each word, case-insensitively. Words are
//     runs of letters; everything else is a separator.
//     "The cat, the HAT!" → ["the": 2, "cat": 1, "hat": 1]
//     (Hint: `dict[key, default: 0] += 1`)
//  2. `mostFrequentWord(in:)` – the most common word; break ties by picking
//     the alphabetically-first word. nil for text with no words.
//  3. `groupedByInitial(_:)` – group names by their uppercased first letter,
//     keeping the original order within each group. Skip empty strings.
//     (Hint: `Dictionary(grouping:by:)`)
// ════════════════════════════════════════════════════════════════════════

func wordFrequencies(in text: String) -> [String: Int] {
    // TODO
    [:]
}

func mostFrequentWord(in text: String) -> String? {
    // TODO
    nil
}

func groupedByInitial(_ names: [String]) -> [Character: [String]] {
    // TODO
    [:]
}
