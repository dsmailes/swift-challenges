// Solution · Challenge 26 · Arrays vs Dictionaries

func wordFrequencies(in text: String) -> [String: Int] {
    let words = text.lowercased().split { !$0.isLetter }
    var counts: [String: Int] = [:]
    for word in words {
        counts[String(word), default: 0] += 1
    }
    return counts
}

func mostFrequentWord(in text: String) -> String? {
    wordFrequencies(in: text)
        .min { a, b in a.value == b.value ? a.key < b.key : a.value > b.value }?
        .key
}

func groupedByInitial(_ names: [String]) -> [Character: [String]] {
    Dictionary(grouping: names.filter { !$0.isEmpty }) {
        Character($0.first!.uppercased())
    }
}
