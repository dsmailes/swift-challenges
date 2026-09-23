import Foundation
import Testing
@testable import Challenges

@Suite("C53 · Listing Files with FileManager")
struct C53_FileManagerTests {
    /// Builds:  root/
    ///            a.swift (5 bytes)   B.SWIFT (3)   notes.txt (10)
    ///            .hidden.swift (4)
    ///            Sources/   c.swift (7)
    func makeFixture() throws -> URL {
        let root = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)
        let sources = root.appending(path: "Sources")
        try FileManager.default.createDirectory(at: sources, withIntermediateDirectories: true)
        try Data("12345".utf8).write(to: root.appending(path: "a.swift"))
        try Data("123".utf8).write(to: root.appending(path: "B.SWIFT"))
        try Data("0123456789".utf8).write(to: root.appending(path: "notes.txt"))
        try Data("1234".utf8).write(to: root.appending(path: ".hidden.swift"))
        try Data("1234567".utf8).write(to: sources.appending(path: "c.swift"))
        return root
    }

    @Test func listsMatchingFiles() throws {
        let root = try makeFixture()
        defer { try? FileManager.default.removeItem(at: root) }
        #expect(try fileNames(in: root, withExtension: "swift") == ["B.SWIFT", "a.swift"])
        #expect(try fileNames(in: root, withExtension: "txt") == ["notes.txt"])
    }

    @Test func sumsSizesRecursively() throws {
        let root = try makeFixture()
        defer { try? FileManager.default.removeItem(at: root) }
        #expect(try totalSize(ofFilesIn: root) == 5 + 3 + 10 + 4 + 7)
    }

    @Test func missingDirectoryThrows() {
        let missing = FileManager.default.temporaryDirectory.appending(path: "does-not-exist-\(UUID())")
        #expect(throws: (any Error).self) {
            try fileNames(in: missing, withExtension: "swift")
        }
    }
}
