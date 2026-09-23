// Solution · Challenge 69 · Actor Reentrancy: Stale State

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
        // Check AND reserve synchronously – no suspension point between them.
        guard available > 0 else {
            throw BookingError.soldOut
        }
        available -= 1

        do {
            // Suspension point: other purchases may run here, but they'll
            // see the ticket as already reserved.
            try await payments.charge(price, customer: customer)
        } catch {
            available += 1 // Release the reservation.
            throw BookingError.paymentFailed
        }

        sold.append(customer)
    }
}
