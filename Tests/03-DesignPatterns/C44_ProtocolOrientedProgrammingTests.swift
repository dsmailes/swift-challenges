import Testing
@testable import Challenges

@Suite("C44 · Protocol-Oriented Programming")
struct C44_ProtocolOrientedProgrammingTests {
    @Test func defaultSpeak() {
        #expect(Dog().speak() == "Dog says woof")
        #expect(Duck().speak() == "Duck says quack")
    }

    @Test func composedAbilities() {
        #expect(Duck().abilities == ["walk", "fly", "swim"])
        #expect(Penguin().abilities == ["walk", "swim"])
        #expect(Dog().abilities == ["walk"])
    }

    @Test func constrainedExtension() {
        #expect(Duck().fly() == "Duck takes off!")
        #expect(Parrot().fly() == "Parrot takes off!")
        // Penguin().fly() must not compile!
    }

    @Test func customImplementationThroughExistential() {
        let animals: [any Animal] = [Dog(), Parrot()]
        #expect(animals.map { $0.speak() } == ["Dog says woof", "Polly wants a cracker!"])
    }
}
