// Solution · Challenge 34 · Key & Date Decoding Strategies

import Foundation

struct UserProfile: Codable, Equatable {
    let firstName: String
    let lastName: String
    let emailAddress: String
    let signupDate: Date
}

func makeProfileDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .iso8601
    return decoder
}

func makeProfileEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    encoder.dateEncodingStrategy = .iso8601
    encoder.outputFormatting = .sortedKeys
    return encoder
}
