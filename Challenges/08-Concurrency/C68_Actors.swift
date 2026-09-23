// ════════════════════════════════════════════════════════════════════════
//  Challenge 68 · Actors                                       Difficulty ★★☆
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  An actor is a reference type that protects its mutable state by only
//  letting ONE task run its code at a time (actor isolation). From outside,
//  every call to an isolated member needs `await`, because you may have to
//  wait your turn. Inside the actor, code is synchronous and can touch state
//  freely – no locks, no data races, checked by the compiler.
//
//  Useful extras:
//  • `nonisolated` members don't touch mutable state, so they can be called
//    synchronously from anywhere (e.g. a description built from `let`s).
//  • An `isolated` parameter (`func f(_ account: isolated BankAccount)`) runs a
//    free function ON that actor, so it can access state without `await`.
//  • Calls to ANOTHER actor always need `await`, even from inside an actor.
//
//  YOUR TASK
//  Finish `BankAccount`:
//  1. `deposit(_:)` – throw `.invalidAmount` for amounts ≤ 0.
//  2. `withdraw(_:)` – throw `.invalidAmount` for ≤ 0, `.insufficientFunds`
//     if the balance is too low (leaving it unchanged).
//  3. `transfer(_:to:)` – withdraw from this account, then deposit into the
//     other. Money must never be created or lost, even with many concurrent
//     transfers in both directions.
//  4. `summary` – "Account <id>", callable WITHOUT await.
//  5. `applyMonthlyFee(to:fee:)` – change the parameter to `isolated` so the
//     body can use the account synchronously; withdraw the fee, or the whole
//     balance if it's smaller than the fee.
// ════════════════════════════════════════════════════════════════════════

enum BankError: Error, Equatable {
    case invalidAmount
    case insufficientFunds
}

actor BankAccount {
    let id: String
    private(set) var balance: Int

    init(id: String, balance: Int = 0) {
        self.id = id
        self.balance = balance
    }

    func deposit(_ amount: Int) throws {
        // TODO
    }

    func withdraw(_ amount: Int) throws {
        // TODO
    }

    func transfer(_ amount: Int, to other: BankAccount) async throws {
        // TODO
    }

    nonisolated var summary: String {
        // TODO
        ""
    }
}

func applyMonthlyFee(to account: BankAccount, fee: Int) async {
    // TODO: make `account` an isolated parameter
}
