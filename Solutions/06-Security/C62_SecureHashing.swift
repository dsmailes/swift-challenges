// Solution · Challenge 62 · Secure Hashing with CryptoKit

import CryptoKit
import Foundation

private extension Sequence where Element == UInt8 {
    var hexString: String {
        map { String(format: "%02x", $0) }.joined()
    }
}

func sha256Hex(of data: Data) -> String {
    SHA256.hash(data: data).hexString
}

func sha256Hex(of string: String) -> String {
    sha256Hex(of: Data(string.utf8))
}

func checksumMatches(_ data: Data, expectedHex: String) -> Bool {
    sha256Hex(of: data) == expectedHex.lowercased()
}

func hmacSHA256Hex(message: String, key: String) -> String {
    let symmetricKey = SymmetricKey(data: Data(key.utf8))
    let code = HMAC<SHA256>.authenticationCode(for: Data(message.utf8), using: symmetricKey)
    return Data(code).hexString
}
