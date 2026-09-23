import Foundation
import Testing
@testable import Challenges

@Suite("C29 · map, compactMap, and flatMap")
struct C29_MapCompactMapTests {
    @Test func scores() {
        #expect(parseScores([" 10", "x", "20 ", "", "-5"]) == [10, 20, -5])
    }

    @Test func initialLetters() {
        #expect(initials(of: ["ada", "Grace", ""]) == ["A", "G", ""])
    }

    @Test func urls() {
        let urls = validWebURLs(["https://swift.org", "ftp://files.example.com", "not a url", "http://example.com/path", "mailto:me@example.com"])
        #expect(urls.map(\.absoluteString) == ["https://swift.org", "http://example.com/path"])
    }

    @Test func tags() {
        #expect(allTags([["swift", "ios"], [], ["xcode"]]) == ["swift", "ios", "xcode"])
    }
}
