// ════════════════════════════════════════════════════════════════════════
//  Challenge 34 · Key & Date Decoding Strategies               Difficulty ★★☆
//  Interview question: "What's the importance of key decoding strategies
//  when using `Codable`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Many web APIs use snake_case keys ("first_name"), while Swift uses
//  camelCase. Rather than writing CodingKeys for every type, set
//  `decoder.keyDecodingStrategy = .convertFromSnakeCase` once. Encoders have
//  the matching `.convertToSnakeCase`. Similar strategies exist for dates.
//
//  YOUR TASK
//  Do NOT add CodingKeys to `UserProfile`. Instead:
//  1. `makeProfileDecoder()` – snake_case → camelCase keys, and ISO-8601
//     dates ("2024-06-10T09:30:00Z").
//  2. `makeProfileEncoder()` – camelCase → snake_case keys, ISO-8601 dates,
//     and `.sortedKeys` output.
// ════════════════════════════════════════════════════════════════════════

import Foundation

struct UserProfile: Codable, Equatable {
    let firstName: String
    let lastName: String
    let emailAddress: String
    let signupDate: Date
}

func makeProfileDecoder() -> JSONDecoder {
    // TODO
    JSONDecoder()
}

func makeProfileEncoder() -> JSONEncoder {
    // TODO
    JSONEncoder()
}
