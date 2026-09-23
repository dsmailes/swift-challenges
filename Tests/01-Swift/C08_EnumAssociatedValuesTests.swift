import Testing
@testable import Challenges

@Suite("C08 · Enum Associated Values")
struct C08_EnumAssociatedValuesTests {
    @Test func amounts() {
        #expect(Payment.cash(amount: 5).amount == 5)
        #expect(Payment.card(number: "1234", amount: 7.5).amount == 7.5)
        #expect(Payment.voucher(code: "X").amount == 0)
    }

    @Test func receiptLines() {
        #expect(Payment.cash(amount: 12.5).receiptLine == "Cash: $12.50")
        #expect(Payment.card(number: "4111222233334242", amount: 9.99).receiptLine == "Card ending 4242: $9.99")
        #expect(Payment.voucher(code: "SPRING").receiptLine == "Voucher SPRING")
    }

    @Test func cardSpend() {
        let payments: [Payment] = [
            .cash(amount: 100),
            .card(number: "1111", amount: 20),
            .voucher(code: "FREE"),
            .card(number: "2222", amount: 5.5),
        ]
        #expect(totalCardSpend(payments) == 25.5)
    }
}
