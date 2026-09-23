import Foundation
import Testing
@testable import Challenges

@Suite("C33 · Codable")
struct C33_CodableTests {
    let json = """
    [
      { "title": "Dune", "pages": 412, "rating": 4.5, "authors": [ { "name": "Frank Herbert" } ] },
      { "title": "Good Omens", "pages": 288, "authors": [ { "name": "Terry Pratchett" }, { "name": "Neil Gaiman" } ] }
    ]
    """

    @Test func decoding() throws {
        let books = try decodeBooks(from: Data(json.utf8))
        try #require(books.count == 2)
        #expect(books[0] == Book(title: "Dune", pageCount: 412, authors: [Author(name: "Frank Herbert")], rating: 4.5))
        #expect(books[1].rating == nil)
        #expect(books[1].authors.map(\.name) == ["Terry Pratchett", "Neil Gaiman"])
    }

    @Test func encoding() throws {
        let book = Book(title: "Emma", pageCount: 474, authors: [Author(name: "Jane Austen")], rating: 4)
        #expect(try encodeSorted(book) == #"{"authors":[{"name":"Jane Austen"}],"pages":474,"rating":4,"title":"Emma"}"#)
    }

    @Test func invalidJSONThrows() {
        #expect(throws: (any Error).self) {
            try decodeBooks(from: Data(#"[{"title": "No pages"}]"#.utf8))
        }
    }
}
