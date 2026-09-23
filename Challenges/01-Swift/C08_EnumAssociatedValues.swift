// ════════════════════════════════════════════════════════════════════════
//  Challenge 08 · Enum Associated Values                       Difficulty ★★☆
//  Interview question: "Can you give useful examples of enum associated
//  values?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Associated values let each enum case carry its own data, so one type can
//  model several shapes of information safely. You extract the data with
//  `switch` or `if case let`.
//
//  YOUR TASK
//  1. `amount` – the money value of the payment. Vouchers are worth 0.
//  2. `receiptLine` – a human-readable line, with amounts to 2 decimal places:
//        .cash(amount: 12.5)                       → "Cash: $12.50"
//        .card(number: "4111222233334242", amount: 9.99) → "Card ending 4242: $9.99"
//        .voucher(code: "SPRING")                  → "Voucher SPRING"
//     (Hint: `String(format: "%.2f", value)` and `suffix(4)`.)
//  3. `totalCardSpend(_:)` – sum the amounts of card payments only. Try using
//     `for case let .card(_, amount) in payments`.
// ════════════════════════════════════════════════════════════════════════

import Foundation

enum Payment {
    case cash(amount: Double)
    case card(number: String, amount: Double)
    case voucher(code: String)

    var amount: Double {
        // TODO
        0
    }

    var receiptLine: String {
        // TODO
        ""
    }
}

func totalCardSpend(_ payments: [Payment]) -> Double {
    // TODO
    0
}
