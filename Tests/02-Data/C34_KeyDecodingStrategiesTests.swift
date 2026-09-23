import Foundation
import Testing
@testable import Challenges

@Suite("C34 · Key & Date Decoding Strategies")
struct C34_KeyDecodingStrategiesTests {
    let json = """
    { "first_name": "Ada", "last_name": "Lovelace", "email_address": "ada@example.com", "signup_date": "2024-06-10T09:30:00Z" }
    """
    let expected = UserProfile(
        firstName: "Ada",
        lastName: "Lovelace",
        emailAddress: "ada@example.com",
        signupDate: Date(timeIntervalSince1970: 1_718_011_800)
    )

    @Test func decodesSnakeCase() throws {
        let profile = try makeProfileDecoder().decode(UserProfile.self, from: Data(json.utf8))
        #expect(profile == expected)
    }

    @Test func encodesSnakeCase() throws {
        let data = try makeProfileEncoder().encode(expected)
        let output = String(decoding: data, as: UTF8.self)
        #expect(output == #"{"email_address":"ada@example.com","first_name":"Ada","last_name":"Lovelace","signup_date":"2024-06-10T09:30:00Z"}"#)
    }
}
