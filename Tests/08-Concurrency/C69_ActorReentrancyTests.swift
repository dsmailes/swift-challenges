import Testing
@testable import Challenges

@Suite("C69 · Actor Reentrancy: Stale State")
struct C69_ActorReentrancyTests {
    struct Declined: Error {}

    /// Takes a little while, and declines anyone whose name starts with "declined".
    struct SlowPayments: PaymentProcessor {
        func charge(_ amount: Int, customer: String) async throws {
            try await Task.sleep(for: .milliseconds(20))
            if customer.hasPrefix("declined") { throw Declined() }
        }
    }

    func buyConcurrently(_ customers: [String], at booth: TicketBooth) async -> [String: BookingError?] {
        await withTaskGroup(of: (String, BookingError?).self) { group in
            for customer in customers {
                group.addTask {
                    do {
                        try await booth.purchase(for: customer)
                        return (customer, nil)
                    } catch {
                        return (customer, error as? BookingError)
                    }
                }
            }
            var outcomes: [String: BookingError?] = [:]
            for await (customer, error) in group {
                outcomes[customer] = error
            }
            return outcomes
        }
    }

    @Test func sequentialPurchasesWork() async throws {
        let booth = TicketBooth(tickets: 2, price: 50, payments: SlowPayments())
        try await booth.purchase(for: "ada")
        try await booth.purchase(for: "grace")
        await #expect(throws: BookingError.soldOut) { try await booth.purchase(for: "alan") }
        #expect(await booth.sold == ["ada", "grace"])
    }

    @Test func doesNotOversellUnderLoad() async {
        let booth = TicketBooth(tickets: 5, price: 50, payments: SlowPayments())
        let outcomes = await buyConcurrently((1...20).map { "fan\($0)" }, at: booth)

        let successes = outcomes.values.filter { $0 == nil }.count
        let soldOut = outcomes.values.filter { $0 == .soldOut }.count
        #expect(successes == 5)
        #expect(soldOut == 15)
        #expect(await booth.available == 0)
        #expect(await booth.sold.count == 5)
    }

    @Test func failedPaymentReturnsTicket() async throws {
        let booth = TicketBooth(tickets: 1, price: 50, payments: SlowPayments())
        await #expect(throws: BookingError.paymentFailed) {
            try await booth.purchase(for: "declined-card")
        }
        #expect(await booth.available == 1)
        try await booth.purchase(for: "ada")
        #expect(await booth.sold == ["ada"])
    }

    @Test func invariantsHoldWithMixedOutcomes() async {
        let booth = TicketBooth(tickets: 3, price: 50, payments: SlowPayments())
        let customers = (1...5).map { "declined\($0)" } + (1...10).map { "fan\($0)" }
        _ = await buyConcurrently(customers, at: booth)

        let available = await booth.available
        let sold = await booth.sold
        #expect(available >= 0)
        #expect(available + sold.count == 3)
        #expect(sold.allSatisfy { !$0.hasPrefix("declined") })
    }
}
