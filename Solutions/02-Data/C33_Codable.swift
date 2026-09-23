// Solution · Challenge 33 · Codable

import Foundation

struct Author: Codable, Equatable {
    let name: String
}

struct Book: Codable, Equatable {
    let title: String
    let pageCount: Int
    let authors: [Author]
    let rating: Double?

    enum CodingKeys: String, CodingKey {
        case title
        case pageCount = "pages"
        case authors
        case rating
    }
}

func decodeBooks(from data: Data) throws -> [Book] {
    try JSONDecoder().decode([Book].self, from: data)
}

func encodeSorted(_ book: Book) throws -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .sortedKeys
    let data = try encoder.encode(book)
    return String(decoding: data, as: UTF8.self)
}
