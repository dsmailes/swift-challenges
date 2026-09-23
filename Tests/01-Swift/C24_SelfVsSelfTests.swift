import Testing
@testable import Challenges

@Suite("C24 · self vs Self")
struct C24_SelfVsSelfTests {
    @Test func temperatures() {
        #expect(Temperature.freezing.celsius == 0)
        #expect(Temperature.boiling.celsius == 100)
        #expect(Temperature.fahrenheit(212) == .boiling)
        #expect(Temperature.freezing.warmer(by: 21.5).celsius == 21.5)
    }

    @Test func dynamicTypeName() {
        let vehicle: Vehicle = Bicycle()
        #expect(vehicle.typeName() == "Bicycle")
        #expect(Truck().typeName() == "Truck")
    }

    @Test func fleetUsesDynamicType() {
        let bikes = Bicycle.fleet(of: 3)
        #expect(bikes.count == 3)
        #expect(bikes.allSatisfy { type(of: $0) == Bicycle.self })
        #expect(Truck.fleet(of: 2).allSatisfy { $0 is Truck })
    }
}
