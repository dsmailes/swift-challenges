import Testing
@testable import Challenges

@Suite("C48 · Phantom Types")
struct C48_PhantomTypesTests {
    @Test func addingSameUnits() {
        let a = Length<Meters>(value: 100)
        let b = Length<Meters>(value: 50)
        #expect(a + b == Length<Meters>(value: 150))
    }

    @Test func conversions() {
        #expect(abs(Length<Feet>(value: 10).inMeters.value - 3.048) < 1e-9)
        #expect(abs(Length<Meters>(value: 3.048).inFeet.value - 10) < 1e-9)
    }

    @Test func routes() {
        let route = [
            Length<Meters>(value: 400),
            Length<Feet>(value: 1000).inMeters,
            Length<Meters>(value: 95.2),
        ]
        #expect(abs(totalDistance(route).value - 800) < 1e-9)
        #expect(totalDistance([]).value == 0)
    }
}
