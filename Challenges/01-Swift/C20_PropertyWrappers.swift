// ════════════════════════════════════════════════════════════════════════
//  Challenge 20 · Property Wrappers                            Difficulty ★★★
//  Interview question: "Apart from the built-in ones, can you give an example
//  of property wrappers?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A property wrapper is a type marked `@propertyWrapper` with a
//  `wrappedValue`. Applying it (`@Clamped(0...100) var health = 100`) moves
//  the storage/logic into the wrapper so it can be reused across properties.
//  A wrapper may also expose a `projectedValue`, accessed with `$name`.
//
//  YOUR TASK
//  1. `Clamped` – keep the value inside `range`, both at init and on set.
//  2. `Trimmed` – strip leading/trailing whitespace & newlines, at init and
//     on set.
//  3. `ChangeCounted` – store any value, and expose a `projectedValue` equal
//     to the number of times it has been SET after initialization.
//  `Player` shows them in use – you shouldn't need to change it.
// ════════════════════════════════════════════════════════════════════════

import Foundation

@propertyWrapper
struct Clamped<Value: Comparable> {
    private var value: Value
    let range: ClosedRange<Value>

    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = wrappedValue // TODO
    }

    var wrappedValue: Value {
        get { value }
        set { value = newValue } // TODO
    }
}

@propertyWrapper
struct Trimmed {
    private var value: String

    init(wrappedValue: String) {
        self.value = wrappedValue // TODO
    }

    var wrappedValue: String {
        get { value }
        set { value = newValue } // TODO
    }
}

@propertyWrapper
struct ChangeCounted<Value> {
    private var value: Value

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get { value }
        set { value = newValue } // TODO
    }

    var projectedValue: Int {
        // TODO
        0
    }
}

struct Player {
    @Clamped(0...100) var health = 100
    @Trimmed var name: String
    @ChangeCounted var score = 0
}
