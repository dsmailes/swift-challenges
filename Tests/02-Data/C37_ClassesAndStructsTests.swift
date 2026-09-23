import Testing
@testable import Challenges

@Suite("C37 · Classes vs Structs")
struct C37_ClassesAndStructsTests {
    @Test func depositsAndWithdrawals() {
        let account = Account(owner: "Ada")
        account.deposit(100)
        account.deposit(-50)
        #expect(account.balance == 100)
        #expect(account.withdraw(30))
        #expect(!account.withdraw(500))
        #expect(account.balance == 70)
    }

    @Test func referenceSemantics() {
        let account = Account(owner: "Ada")
        let sameAccount = account
        sameAccount.deposit(10)
        #expect(account.balance == 10)
    }

    @Test func valueSemantics() {
        let account = Account(owner: "Ada")
        account.deposit(10)
        var snapshot = account.snapshot()
        #expect(snapshot == AccountSnapshot(owner: "Ada", balance: 10))
        snapshot.balance = 1_000_000
        #expect(account.balance == 10)
    }

    @Test func savingsMinimumBalance() {
        let savings = SavingsAccount(owner: "Grace", minimumBalance: 50, interestRate: 0.1)
        savings.deposit(100)
        #expect(!savings.withdraw(60))
        #expect(savings.withdraw(50))
        #expect(savings.balance == 50)
    }

    @Test func interest() {
        let savings = SavingsAccount(owner: "Grace", minimumBalance: 0, interestRate: 0.05)
        savings.deposit(200)
        savings.applyInterest()
        #expect(savings.balance == 210)
    }

    @Test func polymorphism() {
        let account: Account = SavingsAccount(owner: "Grace", minimumBalance: 100, interestRate: 0)
        account.deposit(100)
        #expect(!account.withdraw(1)) // calls the override
    }

    @Test func deinitRuns() {
        var closed = false
        do {
            let account = Account(owner: "Temp")
            account.onClose = { closed = true }
        }
        #expect(closed)
    }
}
