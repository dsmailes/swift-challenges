// Solution · Challenge 29 · map, compactMap, and flatMap

import Foundation

func parseScores(_ raw: [String]) -> [Int] {
    raw.compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
}

func initials(of names: [String]) -> [String] {
    names.map { $0.first.map { String($0).uppercased() } ?? "" }
}

func validWebURLs(_ strings: [String]) -> [URL] {
    strings.compactMap { string in
        guard let url = URL(string: string),
              let scheme = url.scheme?.lowercased(),
              ["http", "https"].contains(scheme),
              url.host() != nil
        else { return nil }
        return url
    }
}

func allTags(_ postTags: [[String]]) -> [String] {
    postTags.flatMap { $0 }
}
