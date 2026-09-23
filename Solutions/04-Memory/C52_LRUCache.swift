// Solution · Challenge 52 · In-Memory Caching (LRU)
// An O(1) implementation: a dictionary maps keys to nodes in a doubly-linked
// list ordered from most- to least-recently used.

final class LRUCache<Key: Hashable, Value> {
    private final class Node {
        let key: Key
        var value: Value
        var previous: Node?
        var next: Node?

        init(key: Key, value: Value) {
            self.key = key
            self.value = value
        }
    }

    let capacity: Int
    private var nodes: [Key: Node] = [:]
    private var head: Node? // most recently used
    private var tail: Node? // least recently used

    init(capacity: Int) {
        precondition(capacity > 0, "Capacity must be positive")
        self.capacity = capacity
    }

    var count: Int { nodes.count }

    func value(forKey key: Key) -> Value? {
        guard let node = nodes[key] else { return nil }
        moveToFront(node)
        return node.value
    }

    func setValue(_ value: Value, forKey key: Key) {
        if let node = nodes[key] {
            node.value = value
            moveToFront(node)
            return
        }

        let node = Node(key: key, value: value)
        nodes[key] = node
        insertAtFront(node)

        if nodes.count > capacity, let lru = tail {
            unlink(lru)
            nodes[lru.key] = nil
        }
    }

    func removeValue(forKey key: Key) {
        guard let node = nodes.removeValue(forKey: key) else { return }
        unlink(node)
    }

    var keysByRecency: [Key] {
        var keys: [Key] = []
        var current = head
        while let node = current {
            keys.append(node.key)
            current = node.next
        }
        return keys
    }

    // MARK: - Linked list helpers

    private func insertAtFront(_ node: Node) {
        node.next = head
        node.previous = nil
        head?.previous = node
        head = node
        if tail == nil { tail = node }
    }

    private func unlink(_ node: Node) {
        node.previous?.next = node.next
        node.next?.previous = node.previous
        if head === node { head = node.next }
        if tail === node { tail = node.previous }
        node.previous = nil
        node.next = nil
    }

    private func moveToFront(_ node: Node) {
        guard head !== node else { return }
        unlink(node)
        insertAtFront(node)
    }
}
