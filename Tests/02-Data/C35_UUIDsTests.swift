import Foundation
import Testing
@testable import Challenges

@Suite("C35 · UUIDs")
struct C35_UUIDsTests {
    let knownID = UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!

    @Test func uniqueIDs() {
        let items = (0..<100).map { TodoItem(title: "Item \($0)") }
        #expect(Set(items.map(\.id)).count == 100)
    }

    @Test func parsing() {
        #expect(parseUUID("E621E1F8-C36C-495A-93FC-0C247A3E6E5F") == knownID)
        #expect(parseUUID("e621e1f8-c36c-495a-93fc-0c247a3e6e5f") == knownID)
        #expect(parseUUID("not-a-uuid") == nil)
    }

    @Test func dedupe() {
        let a = TodoItem(id: knownID, title: "A")
        let b = TodoItem(id: UUID(), title: "B")
        let aCopy = TodoItem(id: knownID, title: "A (copy)")
        #expect(removingDuplicateIDs([a, b, aCopy]) == [a, b])
    }

    @Test func indexing() {
        let first = TodoItem(id: knownID, title: "First")
        let second = TodoItem(id: knownID, title: "Second")
        let other = TodoItem(title: "Other")
        let index = indexByID([first, other, second])
        #expect(index.count == 2)
        #expect(index[knownID]?.title == "Second")
        #expect(index[other.id] == other)
    }
}
