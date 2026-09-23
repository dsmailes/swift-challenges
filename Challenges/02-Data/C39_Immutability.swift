// ════════════════════════════════════════════════════════════════════════
//  Challenge 39 · Immutability                                 Difficulty ★★☆
//  Interview question: "Why is immutability important?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Values that can't change are easier to reason about, safe to share across
//  threads, and can't be modified behind your back. In Swift that means
//  preferring `let` over `var`, and returning NEW values instead of mutating
//  existing ones.
//
//  YOUR TASK
//  1. Make `Money` and `ShoppingCart` fully immutable – every stored
//     property must be `let`. (The tests check this using key paths: a `let`
//     property only produces a read-only `KeyPath`, never a
//     `WritableKeyPath`.)
//  2. `Money.adding(_:)` – return a new Money with the combined amount, or
//     nil if the currencies differ.
//  3. `ShoppingCart.adding(_:)` – return a NEW cart with the item appended.
//     The original cart must be unchanged.
//  4. `ShoppingCart.total` – sum of all item prices (all carts use one
//     currency, given at init).
// ════════════════════════════════════════════════════════════════════════

struct Money: Equatable {
    var cents: Int // TODO: immutable
    var currency: String // TODO: immutable

    func adding(_ other: Money) -> Money? {
        // TODO
        nil
    }
}

struct ShoppingCart {
    var currency: String // TODO: immutable
    var items: [Money] = [] // TODO: immutable

    func adding(_ item: Money) -> ShoppingCart {
        // TODO
        self
    }

    var total: Money {
        // TODO
        Money(cents: 0, currency: currency)
    }
}
