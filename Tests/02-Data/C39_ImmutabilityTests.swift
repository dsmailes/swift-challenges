import Testing
@testable import Challenges

@Suite("C39 · Immutability")
struct C39_ImmutabilityTests {
    // A `let` property only produces a read-only `KeyPath`; a `var` property
    // produces a `WritableKeyPath`. Casting to AnyKeyPath first makes this a
    // runtime check so it compiles either way.

    @Test func moneyIsImmutable() {
        #expect(!((\Money.cents as AnyKeyPath) is WritableKeyPath<Money, Int>))
        #expect(!((\Money.currency as AnyKeyPath) is WritableKeyPath<Money, String>))
    }

    @Test func cartIsImmutable() {
        #expect(!((\ShoppingCart.currency as AnyKeyPath) is WritableKeyPath<ShoppingCart, String>))
        #expect(!((\ShoppingCart.items as AnyKeyPath) is WritableKeyPath<ShoppingCart, [Money]>))
    }

    @Test func addingMoney() {
        let a = Money(cents: 150, currency: "USD")
        let b = Money(cents: 275, currency: "USD")
        #expect(a.adding(b) == Money(cents: 425, currency: "USD"))
        #expect(a.adding(Money(cents: 1, currency: "EUR")) == nil)
    }

    @Test func cartsReturnNewValues() {
        let empty = ShoppingCart(currency: "GBP")
        let one = empty.adding(Money(cents: 500, currency: "GBP"))
        let two = one.adding(Money(cents: 250, currency: "GBP"))
        #expect(empty.items.isEmpty)
        #expect(one.items.count == 1)
        #expect(two.total == Money(cents: 750, currency: "GBP"))
    }
}
