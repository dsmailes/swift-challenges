import Testing
@testable import Challenges

@Suite("C06 · Raw Strings")
struct C06_RawStringsTests {
    @Test func path() {
        #expect(windowsPath == "C:\\Users\\Taylor\\Documents")
    }

    @Test func pattern() {
        #expect(digitsPattern == "\\d+")
    }

    @Test func quote() {
        #expect(sayingQuote("hi") == "He said \"hi\"")
    }

    @Test func digits() {
        #expect(containsDigits("Swift 6"))
        #expect(!containsDigits("Swift"))
    }
}
