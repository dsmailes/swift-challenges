import Testing
@testable import Challenges

@Suite("C31 · Strings Are Collections")
struct C31_StringsAsCollectionsTests {
    @Test func palindromes() {
        #expect(isPalindrome("A man, a plan, a canal: Panama!"))
        #expect(isPalindrome("racecar"))
        #expect(!isPalindrome("Swift"))
    }

    @Test func wordReversal() {
        #expect(reversedWords("the quick brown fox") == "fox brown quick the")
    }

    @Test func vowels() {
        #expect(vowelCount("Hello World") == 3)
        #expect(vowelCount("AEIOU xyz") == 5)
    }

    @Test func graphemeClusters() {
        let family = lengths(of: "👨‍👩‍👧")
        #expect(family.characters == 1)
        #expect(family.scalars == 5)
        #expect(family.utf8 == 18)

        let cafe = lengths(of: "café")
        #expect(cafe.characters == 4)
    }
}
