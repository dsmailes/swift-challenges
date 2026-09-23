// Solution · Challenge 08 · Enum Associated Values

import Foundation

enum Payment {
    case cash(amount: Double)
    case card(number: String, amount: Double)
    case voucher(code: String)

    var amount: Double {
        switch self {
        case .cash(let amount), .card(_, let amount):
            amount
        case .voucher:
            0
        }
    }

    var receiptLine: String {
        switch self {
        case .cash(let amount):
            "Cash: $\(String(format: "%.2f", amount))"
        case .card(let number, let amount):
            "Card ending \(number.suffix(4)): $\(String(format: "%.2f", amount))"
        case .voucher(let code):
            "Voucher \(code)"
        }
    }
}

func totalCardSpend(_ payments: [Payment]) -> Double {
    var total = 0.0
    for case let .card(_, amount) in payments {
        total += amount
    }
    return total
}
