// Solution · Challenge 19 · Key Paths

struct Song {
    var title: String
    var artist: String
    var plays: Int
}

extension Sequence {
    func sorted<Value: Comparable>(on keyPath: KeyPath<Element, Value>, ascending: Bool = true) -> [Element] {
        sorted {
            ascending
                ? $0[keyPath: keyPath] < $1[keyPath: keyPath]
                : $0[keyPath: keyPath] > $1[keyPath: keyPath]
        }
    }

    func pluck<Value>(_ keyPath: KeyPath<Element, Value>) -> [Value] {
        map { $0[keyPath: keyPath] }
    }
}

func sum<T>(of keyPath: KeyPath<T, Int>, in items: [T]) -> Int {
    items.reduce(0) { $0 + $1[keyPath: keyPath] }
}
