import Testing
@testable import Challenges

@Suite("C52 · In-Memory Caching (LRU)")
struct C52_LRUCacheTests {
    @Test func storesAndRetrieves() {
        let cache = LRUCache<String, Int>(capacity: 2)
        cache.setValue(1, forKey: "a")
        #expect(cache.value(forKey: "a") == 1)
        #expect(cache.value(forKey: "missing") == nil)
    }

    @Test func evictsLeastRecentlyUsed() {
        let cache = LRUCache<String, Int>(capacity: 2)
        cache.setValue(1, forKey: "a")
        cache.setValue(2, forKey: "b")
        _ = cache.value(forKey: "a") // "b" is now least recently used
        cache.setValue(3, forKey: "c")

        #expect(cache.count == 2)
        #expect(cache.value(forKey: "b") == nil)
        #expect(cache.value(forKey: "a") == 1)
        #expect(cache.value(forKey: "c") == 3)
    }

    @Test func updatingRefreshesRecency() {
        let cache = LRUCache<Int, String>(capacity: 3)
        cache.setValue("one", forKey: 1)
        cache.setValue("two", forKey: 2)
        cache.setValue("three", forKey: 3)
        cache.setValue("uno", forKey: 1)
        #expect(cache.keysByRecency == [1, 3, 2])
        cache.setValue("four", forKey: 4)
        #expect(cache.keysByRecency == [4, 1, 3])
        #expect(cache.value(forKey: 1) == "uno")
    }

    @Test func removal() {
        let cache = LRUCache<String, Int>(capacity: 3)
        cache.setValue(1, forKey: "a")
        cache.setValue(2, forKey: "b")
        cache.removeValue(forKey: "a")
        cache.removeValue(forKey: "zzz")
        #expect(cache.count == 1)
        #expect(cache.keysByRecency == ["b"])
    }
}
