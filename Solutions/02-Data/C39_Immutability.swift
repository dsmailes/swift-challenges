// Solution · Challenge 39 · Immutability

struct Money: Equatable {
    let cents: Int
    let currency: String

    func adding(_ other: Money) -> Money? {
        guard currency == other.currency else { return nil }
        return Money(cents: cents + other.cents, currency: currency)
    }
}

struct ShoppingCart {
    let currency: String
    let items: [Money]

    init(currency: String, items: [Money] = []) {
        self.currency = currency
        self.items = items
    }

    func adding(_ item: Money) -> ShoppingCart {
        ShoppingCart(currency: currency, items: items + [item])
    }

    var total: Money {
        Money(cents: items.reduce(0) { $0 + $1.cents }, currency: currency)
    }
}
