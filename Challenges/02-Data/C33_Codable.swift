// ════════════════════════════════════════════════════════════════════════
//  Challenge 33 · Codable                                      Difficulty ★★☆
//  Interview question: "What does the `Codable` protocol do?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `Codable` (= `Encodable & Decodable`) lets Swift automatically convert your
//  types to and from formats such as JSON. When the JSON keys don't match
//  your property names, add a nested `CodingKeys` enum. Optional properties
//  may be missing from the JSON entirely.
//
//  YOUR TASK
//  The API returns books like this:
//
//      { "title": "Dune", "pages": 412, "rating": 4.5,
//        "authors": [ { "name": "Frank Herbert" } ] }
//
//  `rating` may be missing. Note the property is `pageCount` but the JSON key
//  is `pages`.
//
//  1. Add a `CodingKeys` enum to `Book` so decoding & encoding work.
//  2. `decodeBooks(from:)` – decode a JSON array of books.
//  3. `encodeSorted(_:)` – encode one book to a JSON string with
//     `.sortedKeys` output formatting (and no pretty printing).
// ════════════════════════════════════════════════════════════════════════

import Foundation

struct Author: Codable, Equatable {
    let name: String
}

struct Book: Codable, Equatable {
    let title: String
    let pageCount: Int
    let authors: [Author]
    let rating: Double?

    // TODO: CodingKeys
}

func decodeBooks(from data: Data) throws -> [Book] {
    // TODO
    []
}

func encodeSorted(_ book: Book) throws -> String {
    // TODO
    ""
}
