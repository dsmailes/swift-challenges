// Solution · Challenge 27 · Arrays vs Sets

func removingDuplicates<T: Hashable>(_ items: [T]) -> [T] {
    var seen = Set<T>()
    return items.filter { seen.insert($0).inserted }
}

func mutualFollowers(_ first: [String], _ second: [String]) -> Set<String> {
    Set(first).intersection(second)
}

func hasDuplicates<T: Hashable>(_ items: [T]) -> Bool {
    Set(items).count != items.count
}

func missingNumbers(in numbers: [Int], expected range: ClosedRange<Int>) -> [Int] {
    Set(range).subtracting(numbers).sorted()
}
