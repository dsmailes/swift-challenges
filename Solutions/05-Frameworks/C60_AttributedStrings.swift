// Solution · Challenge 60 · Attributed Strings

import Foundation

extension NSAttributedString.Key {
    static let highlight = NSAttributedString.Key("SwiftChallenges.highlight")
}

func highlighting(_ keyword: String, in text: String) -> NSAttributedString {
    let result = NSMutableAttributedString(string: text)
    guard !keyword.isEmpty else { return result }

    let nsText = text as NSString
    var searchRange = NSRange(location: 0, length: nsText.length)

    while true {
        let found = nsText.range(of: keyword, options: .caseInsensitive, range: searchRange)
        guard found.location != NSNotFound else { break }

        result.addAttribute(.highlight, value: true, range: found)
        let nextStart = found.location + found.length
        searchRange = NSRange(location: nextStart, length: nsText.length - nextStart)
    }

    return result
}

func linkifyingMentions(in text: String) -> NSAttributedString {
    let result = NSMutableAttributedString(string: text)
    let regex = try! NSRegularExpression(pattern: #"@(\w+)"#)
    let nsText = text as NSString

    for match in regex.matches(in: text, range: NSRange(location: 0, length: nsText.length)) {
        let username = nsText.substring(with: match.range(at: 1))
        let url = URL(string: "https://example.com/users/\(username)")!
        result.addAttribute(.link, value: url, range: match.range)
    }

    return result
}

func highlightedFragments(in attributed: NSAttributedString) -> [String] {
    var fragments: [String] = []
    let fullRange = NSRange(location: 0, length: attributed.length)

    attributed.enumerateAttribute(.highlight, in: fullRange) { value, range, _ in
        if value as? Bool == true {
            fragments.append(attributed.attributedSubstring(from: range).string)
        }
    }

    return fragments
}
