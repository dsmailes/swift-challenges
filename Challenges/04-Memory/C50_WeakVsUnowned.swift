// ════════════════════════════════════════════════════════════════════════
//  Challenge 50 · weak vs unowned                              Difficulty ★★☆
//  Interview question: "What is the difference between `weak` and
//  `unowned`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Both break retain cycles by not increasing the reference count.
//  • `weak` – always optional; becomes nil automatically when the object is
//    freed. Use when the other object may legitimately go away first.
//  • `unowned` – non-optional; you promise the other object will ALWAYS
//    outlive this reference. Accessing it after deallocation crashes.
//
//  YOUR TASK
//  1. A `CreditCard` can't exist without its `Customer`, and a customer
//     always outlives their card. Change `CreditCard.customer` so there's no
//     cycle – keeping it NON-optional. Which keyword fits?
//  2. A `Mentor` may leave before their `Student`. Change `Student.mentor` so
//     it doesn't keep the mentor alive and becomes nil when they leave.
//  3. `Student.mentorName` – the mentor's name, or "No mentor".
// ════════════════════════════════════════════════════════════════════════

final class Customer {
    let name: String
    var card: CreditCard?
    var onDeinit: (() -> Void)?

    init(name: String) { self.name = name }
    deinit { onDeinit?() }
}

final class CreditCard {
    let number: String
    let customer: Customer // TODO
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
    var mentor: Mentor? // TODO

    init(name: String) { self.name = name }

    var mentorName: String {
        // TODO
        ""
    }
}
