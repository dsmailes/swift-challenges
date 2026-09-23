// Solution · Challenge 37 · Classes vs Structs

class Account {
    let owner: String
    private(set) var balance: Double = 0
    var onClose: (() -> Void)?

    init(owner: String) {
        self.owner = owner
    }

    func deposit(_ amount: Double) {
        guard amount > 0 else { return }
        balance += amount
    }

    func withdraw(_ amount: Double) -> Bool {
        guard amount > 0, amount <= balance else { return false }
        balance -= amount
        return true
    }

    func snapshot() -> AccountSnapshot {
        AccountSnapshot(owner: owner, balance: balance)
    }

    deinit {
        onClose?()
    }
}

final class SavingsAccount: Account {
    let minimumBalance: Double
    let interestRate: Double

    init(owner: String, minimumBalance: Double, interestRate: Double) {
        self.minimumBalance = minimumBalance
        self.interestRate = interestRate
        super.init(owner: owner)
    }

    override func withdraw(_ amount: Double) -> Bool {
        guard balance - amount >= minimumBalance else { return false }
        return super.withdraw(amount)
    }

    func applyInterest() {
        deposit(balance * interestRate)
    }
}

struct AccountSnapshot: Equatable {
    var owner: String
    var balance: Double
}
