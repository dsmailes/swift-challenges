// ════════════════════════════════════════════════════════════════════════
//  Challenge 37 · Classes vs Structs                           Difficulty ★★☆
//  Interview question: "What are the main differences between classes and
//  structs in Swift?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Classes can inherit and override, have deinitializers, and are reference
//  types – many variables can point at one shared instance. Structs are value
//  types – each copy is independent – get a free memberwise initializer, and
//  need `mutating` to change their own properties.
//
//  YOUR TASK
//  1. `Account` (class)
//       • `deposit(_:)` – add positive amounts only (ignore ≤ 0)
//       • `withdraw(_:)` – subtract and return true if the balance allows it;
//         otherwise change nothing and return false
//       • `snapshot()` – return an `AccountSnapshot` of the current state
//       • add a `deinit` that calls `onClose` so we can observe destruction
//  2. `SavingsAccount` (subclass)
//       • override `withdraw(_:)` so the balance can never drop below
//         `minimumBalance`. Reuse the superclass's logic via `super`.
//       • `applyInterest()` – increase the balance by `interestRate`
//         (e.g. 0.05 → +5%). Use `deposit` – `balance` has a private setter.
//  3. `AccountSnapshot` (struct) – already done. The tests show that
//     changing a copied snapshot never affects the account.
// ════════════════════════════════════════════════════════════════════════

class Account {
    let owner: String
    private(set) var balance: Double = 0
    var onClose: (() -> Void)?

    init(owner: String) {
        self.owner = owner
    }

    func deposit(_ amount: Double) {
        // TODO
    }

    func withdraw(_ amount: Double) -> Bool {
        // TODO
        false
    }

    func snapshot() -> AccountSnapshot {
        // TODO
        AccountSnapshot(owner: "", balance: 0)
    }

    // TODO: deinit
}

final class SavingsAccount: Account {
    let minimumBalance: Double
    let interestRate: Double

    init(owner: String, minimumBalance: Double, interestRate: Double) {
        self.minimumBalance = minimumBalance
        self.interestRate = interestRate
        super.init(owner: owner)
    }

    // TODO: override withdraw

    func applyInterest() {
        // TODO
    }
}

struct AccountSnapshot: Equatable {
    var owner: String
    var balance: Double
}
