import Foundation
import Testing
@testable import Challenges

@Suite("C62 · Secure Hashing with CryptoKit")
struct C62_SecureHashingTests {
    @Test func knownVectors() {
        #expect(sha256Hex(of: "abc") == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
        #expect(sha256Hex(of: "") == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
    }

    @Test func dataAndStringAgree() {
        #expect(sha256Hex(of: Data("hello".utf8)) == sha256Hex(of: "hello"))
    }

    @Test func checksums() {
        let data = Data("abc".utf8)
        #expect(checksumMatches(data, expectedHex: "BA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD"))
        #expect(!checksumMatches(Data("abd".utf8), expectedHex: "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"))
    }

    @Test func hmac() {
        #expect(
            hmacSHA256Hex(message: "The quick brown fox jumps over the lazy dog", key: "key")
                == "f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8"
        )
    }
}
