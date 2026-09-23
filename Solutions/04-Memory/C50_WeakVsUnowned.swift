// Solution · Challenge 50 · weak vs unowned

final class Customer {
    let name: String
    var card: CreditCard?
    var onDeinit: (() -> Void)?

    init(name: String) { self.name = name }
    deinit { onDeinit?() }
}

final class CreditCard {
    let number: String
    unowned let customer: Customer // A card never outlives its customer.
    var onDeinit: (() -> Void)?

    init(number: String, customer: Customer) {
        self.number = number
        self.customer = customer
    }

    deinit { onDeinit?() }
}

final class Mentor {
    let name: String
    var students: [Student] = []

    init(name: String) { self.name = name }
}

final class Student {
    let name: String
    weak var mentor: Mentor? // A mentor may leave first.

    init(name: String) { self.name = name }

    var mentorName: String {
        mentor?.name ?? "No mentor"
    }
}
