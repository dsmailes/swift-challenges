// ════════════════════════════════════════════════════════════════════════
//  Challenge 38 · Value vs Reference Types (Copy-on-Write)     Difficulty ★★★
//  Interview question: "What's the difference between a value type and a
//  reference type?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Copying a value type gives you an independent copy; copying a reference
//  type gives you another pointer to the same object. Swift's Array,
//  Dictionary and String are value types that *internally* use a class for
//  storage – copies share that storage until one of them is mutated, and
//  only then is the storage duplicated. This is called copy-on-write (CoW).
//
//  YOUR TASK
//  `CoWList` wraps a reference-type `ListStorage`. As written, it's broken:
//  copying a CoWList and appending to the copy also changes the original!
//
//  Fix it so that `append(_:)` and the subscript setter:
//    • check `isKnownUniquelyReferenced(&storage)`
//    • if the storage is shared, replace it with a copy BEFORE mutating
//  Unshared storage must be mutated in place (no needless copying) –
//  `storageID` lets the tests check this.
// ════════════════════════════════════════════════════════════════════════

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
            // TODO: copy-on-write
            storage.elements[index] = newValue
        }
    }

    mutating func append(_ element: Element) {
        // TODO: copy-on-write
        storage.elements.append(element)
    }
}
