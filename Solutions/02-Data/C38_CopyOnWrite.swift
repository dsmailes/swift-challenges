// Solution · Challenge 38 · Value vs Reference Types (Copy-on-Write)

final class ListStorage<Element> {
    var elements: [Element]

    init(elements: [Element]) {
        self.elements = elements
    }
}

struct CoWList<Element> {
    private var storage = ListStorage<Element>(elements: [])

    /// Identifies the underlying storage object (for testing).
    var storageID: ObjectIdentifier { ObjectIdentifier(storage) }

    var count: Int { storage.elements.count }

    subscript(index: Int) -> Element {
        get { storage.elements[index] }
        set {
            makeUnique()
            storage.elements[index] = newValue
        }
    }

    mutating func append(_ element: Element) {
        makeUnique()
        storage.elements.append(element)
    }

    private mutating func makeUnique() {
        if !isKnownUniquelyReferenced(&storage) {
            storage = ListStorage(elements: storage.elements)
        }
    }
}
