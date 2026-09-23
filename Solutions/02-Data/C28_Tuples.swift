// Solution · Challenge 28 · Tuples

func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    guard var result = numbers.first.map({ (min: $0, max: $0) }) else { return nil }
    for number in numbers.dropFirst() {
        if number < result.min { result.min = number }
        if number > result.max { result.max = number }
    }
    return result
}

func swapped<A, B>(_ pair: (A, B)) -> (B, A) {
    let (a, b) = pair
    return (b, a)
}

func isSameLocation(_ a: (lat: Double, lon: Double), _ b: (lat: Double, lon: Double)) -> Bool {
    a == b
}

func splitName(_ fullName: String) -> (first: String, last: String) {
    let parts = fullName.split(separator: " ", maxSplits: 1)
    return (
        first: parts.first.map(String.init) ?? "",
        last: parts.count > 1 ? String(parts[1]) : ""
    )
}
