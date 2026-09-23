// ════════════════════════════════════════════════════════════════════════
//  Challenge 52 · In-Memory Caching (LRU)                      Difficulty ★★★
//  Interview question: "What is an efficient way to cache data in memory?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Apple's `NSCache` is a great default: it's thread-safe and automatically
//  evicts objects under memory pressure (but only stores class instances and
//  gives no guarantees about *which* items it evicts). When you need
//  predictable behavior, a Least-Recently-Used (LRU) cache is the classic
//  answer: when it's full, the item that hasn't been touched for the longest
//  time is thrown away.
//
//  YOUR TASK
//  Finish `LRUCache`:
//  • `value(forKey:)` – return the value and mark the key as most recently
//    used.
//  • `setValue(_:forKey:)` – insert or update, marking the key as most
//    recently used. If this pushes `count` above `capacity`, evict the least
//    recently used key.
//  • `removeValue(forKey:)`
//  • `keysByRecency` – all keys, most recently used first.
//
//  A dictionary + array implementation is fine to get the tests passing.
//  BONUS: make every operation O(1) with a dictionary of nodes in a
//  doubly-linked list.
// ════════════════════════════════════════════════════════════════════════

final class LRUCache<Key: Hashable, Value> {
    let capacity: Int
    private var storage: [Key: Value] = [:]

    init(capacity: Int) {
        precondition(capacity > 0, "Capacity must be positive")
        self.capacity = capacity
    }

    var count: Int { storage.count }

    func value(forKey key: Key) -> Value? {
        // TODO: mark as recently used
        storage[key]
    }

    func setValue(_ value: Value, forKey key: Key) {
        // TODO: track recency & evict
        storage[key] = value
    }

    func removeValue(forKey key: Key) {
        // TODO
    }

    var keysByRecency: [Key] {
        // TODO
        []
    }
}
