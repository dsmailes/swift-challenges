import Testing
@testable import Challenges

@Suite("C38 · Value vs Reference Types (Copy-on-Write)")
struct C38_CopyOnWriteTests {
    @Test func copiesAreIndependent() {
        var original = CoWList<Int>()
        original.append(1)

        var copy = original
        copy.append(2)
        copy[0] = 99

        #expect(original.count == 1)
        #expect(original[0] == 1)
        #expect(copy.count == 2)
        #expect(copy[0] == 99)
    }

    @Test func copiesShareStorageUntilMutation() {
        var original = CoWList<String>()
        original.append("a")
        var copy = original
        #expect(copy.storageID == original.storageID)

        copy.append("b")
        #expect(copy.storageID != original.storageID)
    }

    @Test func uniqueStorageIsMutatedInPlace() {
        var list = CoWList<Int>()
        list.append(1)
        let before = list.storageID
        list.append(2)
        list[0] = 5
        #expect(list.storageID == before)
    }
}
