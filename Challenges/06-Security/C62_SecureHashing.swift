// ════════════════════════════════════════════════════════════════════════
//  Challenge 62 · Secure Hashing with CryptoKit                Difficulty ★★☆
//  Interview question: "How would you calculate the secure hash value for
//  some data?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A cryptographic hash (e.g. SHA-256) turns any input into a fixed-size
//  digest: the same input always gives the same digest, and it's infeasible
//  to reverse or find collisions. Use them for integrity checks (did this
//  download change?) and as building blocks (HMAC for message
//  authentication). Apple's CryptoKit makes this a one-liner. Never use plain
//  hashes to store passwords – use a slow key-derivation function instead.
//
//  YOUR TASK
//  1. `sha256Hex(of:)` for `Data` – lowercase hexadecimal SHA-256 digest.
//  2. `sha256Hex(of:)` for `String` – hash its UTF-8 bytes.
//  3. `checksumMatches(_:expectedHex:)` – compare against an expected digest,
//     case-insensitively.
//  4. `hmacSHA256Hex(message:key:)` – an HMAC-SHA256 of the message using a
//     `SymmetricKey` built from the key's UTF-8 bytes, as lowercase hex.
// ════════════════════════════════════════════════════════════════════════

import CryptoKit
import Foundation

func sha256Hex(of data: Data) -> String {
    // TODO
    ""
}

func sha256Hex(of string: String) -> String {
    // TODO
    ""
}

func checksumMatches(_ data: Data, expectedHex: String) -> Bool {
    // TODO
    false
}

func hmacSHA256Hex(message: String, key: String) -> String {
    // TODO
    ""
}
