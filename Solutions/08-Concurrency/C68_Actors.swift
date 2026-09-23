// Solution · Challenge 68 · Actors

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
        guard amount > 0 else { throw BankError.invalidAmount }
        balance += amount
    }

    func withdraw(_ amount: Int) throws {
        guard amount > 0 else { throw BankError.invalidAmount }
        guard amount <= balance else { throw BankError.insufficientFunds }
        balance -= amount
    }

    func transfer(_ amount: Int, to other: BankAccount) async throws {
        // Check-and-withdraw happens synchronously on this actor, so nothing
        // can interleave between the balance check and the change.
        try withdraw(amount)
        // This `await` is a suspension point: other calls on this actor may
        // run here. That's fine – we've already finished changing our state.
        try await other.deposit(amount)
    }

    nonisolated var summary: String {
        "Account \(id)" // `id` is an immutable, Sendable `let`.
    }
}

func applyMonthlyFee(to account: isolated BankAccount, fee: Int) {
    // Runs on the account's actor: no `await` needed.
    let charge = min(fee, account.balance)
    if charge > 0 {
        try? account.withdraw(charge)
    }
}
