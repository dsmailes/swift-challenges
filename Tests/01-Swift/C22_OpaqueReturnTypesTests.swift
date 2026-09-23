import Testing
@testable import Challenges

@Suite("C22 · Opaque Return Types")
struct C22_OpaqueReturnTypesTests {
    @Test func squareNumbers() {
        #expect(Array(squares(upTo: 30)) == [1, 4, 9, 16, 25])
        #expect(Array(squares(upTo: 1)) == [1])
        #expect(squares(upTo: 0).isEmpty)
    }

    @Test func formatters() {
        #expect(makeFormatter(uppercase: true).format("hi") == "[HI]")
        #expect(makeFormatter(uppercase: false).format("hi") == "[hi]")
    }
}
