import Testing
@testable import Challenges

@Suite("C68 · Actors")
struct C68_ActorsTests {
    @Test func depositsAndWithdrawals() async throws {
        let account = BankAccount(id: "A", balance: 100)
        try await account.deposit(50)
        try await account.withdraw(30)
        #expect(await account.balance == 120)
    }

    @Test func invalidOperations() async {
        let account = BankAccount(id: "A", balance: 10)
        await #expect(throws: BankError.invalidAmount) { try await account.deposit(0) }
        await #expect(throws: BankError.invalidAmount) { try await account.withdraw(-5) }
        await #expect(throws: BankError.insufficientFunds) { try await account.withdraw(11) }
        #expect(await account.balance == 10)
    }

    @Test func concurrentDepositsAreSafe() async {
        let account = BankAccount(id: "A")
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<1_000 {
                group.addTask { try? await account.deposit(1) }
            }
        }
        #expect(await account.balance == 1_000)
    }

    @Test func transfersConserveMoney() async {
        let a = BankAccount(id: "A", balance: 1_000)
        let b = BankAccount(id: "B", balance: 1_000)
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<100 {
                group.addTask { try? await a.transfer(10, to: b) }
                group.addTask { try? await b.transfer(5, to: a) }
            }
        }
        #expect(await a.balance == 500)
        #expect(await b.balance == 1_500)
    }

    @Test func failedTransferChangesNothing() async {
        let a = BankAccount(id: "A", balance: 5)
        let b = BankAccount(id: "B", balance: 0)
        await #expect(throws: BankError.insufficientFunds) { try await a.transfer(10, to: b) }
        #expect(await a.balance == 5)
        #expect(await b.balance == 0)
    }

    @Test func nonisolatedSummary() {
        let account = BankAccount(id: "XYZ")
        #expect(account.summary == "Account XYZ") // no await!
    }

    @Test func monthlyFee() async {
        let rich = BankAccount(id: "R", balance: 100)
        let poor = BankAccount(id: "P", balance: 3)
        await applyMonthlyFee(to: rich, fee: 5)
        await applyMonthlyFee(to: poor, fee: 5)
        #expect(await rich.balance == 95)
        #expect(await poor.balance == 0)
    }
}
