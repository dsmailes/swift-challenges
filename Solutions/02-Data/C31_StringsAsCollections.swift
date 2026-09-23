// Solution · Challenge 31 · Strings Are Collections

func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
    return cleaned.elementsEqual(cleaned.reversed())
}

func reversedWords(_ sentence: String) -> String {
    sentence.split(separator: " ").reversed().joined(separator: " ")
}

func vowelCount(_ text: String) -> Int {
    text.lowercased().filter { "aeiou".contains($0) }.count
}

func lengths(of text: String) -> (characters: Int, scalars: Int, utf8: Int) {
    (text.count, text.unicodeScalars.count, text.utf8.count)
}
