import Testing
@testable import Challenges

@Suite("C50 · weak vs unowned")
struct C50_WeakVsUnownedTests {
    final class Flags {
        var customerFreed = false
        var cardFreed = false
    }

    @Test func customerAndCardAreFreed() {
        let flags = Flags()
        do {
            let customer = Customer(name: "Ada")
            let card = CreditCard(number: "4242", customer: customer)
            customer.card = card
            customer.onDeinit = { flags.customerFreed = true }
            card.onDeinit = { flags.cardFreed = true }
            #expect(card.customer.name == "Ada")
        }
        #expect(flags.customerFreed)
        #expect(flags.cardFreed)
    }

    @Test func weakMentorBecomesNil() {
        let student = Student(name: "Sam")
        do {
            let mentor = Mentor(name: "Grace")
            mentor.students.append(student)
            student.mentor = mentor
            #expect(student.mentorName == "Grace")
        }
        #expect(student.mentor == nil)
        #expect(student.mentorName == "No mentor")
    }
}
