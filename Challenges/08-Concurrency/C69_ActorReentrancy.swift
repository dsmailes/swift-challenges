// ════════════════════════════════════════════════════════════════════════
//  Challenge 69 · Actor Reentrancy: Stale State                Difficulty ★★★
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Actors guarantee only one task runs *between suspension points*. They do
//  NOT hold the actor locked across an `await`. When an actor method awaits,
//  the actor is free to run OTHER calls – including more calls to the very
//  same method – before the first one resumes. This is actor reentrancy.
//
//  Reentrancy prevents deadlocks, but it means any assumption you checked
//  BEFORE an `await` may be false AFTER it:
//
//      guard available > 0 else { throw … }   // ✅ true right now…
//      try await payments.charge(…)           // 💤 other purchases run here
//      available -= 1                         // 💥 …but maybe not any more
//
//  The rules of thumb:
//  • Do all your check-and-mutate work synchronously, BEFORE the await
//    (e.g. reserve the ticket first), and undo it if the async step fails.
//  • Or re-check your assumptions AFTER every await.
//  • Never assume actor state is unchanged across a suspension point.
//
//  YOUR TASK
//  `TicketBooth.purchase(for:)` below compiles fine, and works when
//  customers arrive one at a time. Under concurrent load it OVERSELLS.
//  Fix it so that:
//  • no more tickets are ever sold than were available
//  • `available` never goes negative
//  • buyers who arrive when no ticket is left (including reserved ones)
//    get `.soldOut`
//  • if payment fails, throw `.paymentFailed` and give the ticket back.
//  Hint: reserve the ticket before you await the payment.
// ════════════════════════════════════════════════════════════════════════

protocol PaymentProcessor: Sendable {
    func charge(_ amount: Int, customer: String) async throws
}

enum BookingError: Error, Equatable {
    case soldOut
    case paymentFailed
}

actor TicketBooth {
    private(set) var available: Int
    private(set) var sold: [String] = []
    private let price: Int
    private let payments: any PaymentProcessor

    init(tickets: Int, price: Int, payments: any PaymentProcessor) {
        self.available = tickets
        self.price = price
        self.payments = payments
    }

    func purchase(for customer: String) async throws {
        // TODO: this has a reentrancy bug!
        guard available > 0 else {
            throw BookingError.soldOut
        }

        do {
            try await payments.charge(price, customer: customer)
        } catch {
            throw BookingError.paymentFailed
        }

        available -= 1
        sold.append(customer)
    }
}
