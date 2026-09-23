// Solution · Challenge 20 · Property Wrappers

import Foundation

@propertyWrapper
struct Clamped<Value: Comparable> {
    private var value: Value
    let range: ClosedRange<Value>

    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = Self.clamp(wrappedValue, to: range)
    }

    var wrappedValue: Value {
        get { value }
        set { value = Self.clamp(newValue, to: range) }
    }

    private static func clamp(_ value: Value, to range: ClosedRange<Value>) -> Value {
        min(max(value, range.lowerBound), range.upperBound)
    }
}

@propertyWrapper
struct Trimmed {
    private var value: String

    init(wrappedValue: String) {
        self.value = wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
}

@propertyWrapper
struct ChangeCounted<Value> {
    private var value: Value
    private var changes = 0

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get { value }
        set {
            value = newValue
            changes += 1
        }
    }

    var projectedValue: Int {
        changes
    }
}

struct Player {
    @Clamped(0...100) var health = 100
    @Trimmed var name: String
    @ChangeCounted var score = 0
}
