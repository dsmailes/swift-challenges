// Solution · Challenge 09 · Closures

func makeCounter(startingAt start: Int = 0, step: Int = 1) -> () -> Int {
    var next = start
    return {
        defer { next += step }
        return next
    }
}

func applyTwice<T>(_ transform: (T) -> T, to value: T) -> T {
    transform(transform(value))
}

func sortedByLength(_ words: [String]) -> [String] {
    words.sorted { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }
}
