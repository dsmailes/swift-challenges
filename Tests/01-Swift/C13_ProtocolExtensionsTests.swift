import Testing
@testable import Challenges

@Suite("C13 · Extensions vs Protocol Extensions")
struct C13_ProtocolExtensionsTests {
    @Test func evenness() {
        #expect(4.isEven)
        #expect(!7.isEven)
        #expect(0.isEven)
    }

    @Test func timesRunsClosure() {
        var count = 0
        3.times { count += 1 }
        #expect(count == 3)
        (-2).times { count += 1 }
        #expect(count == 3)
    }

    @Test func totalsWorkOnAnyIntegerCollection() {
        #expect([1, 2, 3].total == 6)
        #expect(Set<UInt8>([10, 20]).total == 30)
        #expect([1, 2, 3, 4][1...2].total == 5)
    }

    @Test func means() {
        #expect([1, 2, 3, 4].mean == 2.5)
        #expect([Int]().mean == nil)
    }

    @Test func uniqueness() {
        #expect([1, 2, 3].isAllUnique)
        #expect(!"hello".isAllUnique)
        #expect("world".isAllUnique)
    }
}
