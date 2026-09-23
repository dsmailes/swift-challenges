import Testing
@testable import Challenges

@Suite("C20 · Property Wrappers")
struct C20_PropertyWrappersTests {
    @Test func clampsOnSet() {
        var player = Player(name: "Link")
        player.health = 150
        #expect(player.health == 100)
        player.health = -20
        #expect(player.health == 0)
    }

    @Test func clampsOnInit() {
        let wrapper = Clamped(wrappedValue: 12, 1...10)
        #expect(wrapper.wrappedValue == 10)
    }

    @Test func trims() {
        var player = Player(name: "  Zelda \n")
        #expect(player.name == "Zelda")
        player.name = "\tGanon  "
        #expect(player.name == "Ganon")
    }

    @Test func countsChanges() {
        var player = Player(name: "Mario")
        #expect(player.$score == 0)
        player.score += 10
        player.score = 5
        #expect(player.score == 5)
        #expect(player.$score == 2)
    }
}
