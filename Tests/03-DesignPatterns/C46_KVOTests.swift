import Testing
@testable import Challenges

@Suite("C46 · Key-Value Observing (KVO)")
struct C46_KVOTests {
    @Test func recordsChanges() {
        let thermostat = Thermostat()
        let logger = TemperatureLogger()
        logger.startObserving(thermostat)

        thermostat.temperature = 21
        thermostat.temperature = 19.5

        #expect(logger.readings == [21, 19.5])
    }

    @Test func stopsRecording() {
        let thermostat = Thermostat()
        let logger = TemperatureLogger()
        logger.startObserving(thermostat)
        thermostat.temperature = 22
        logger.stopObserving()
        thermostat.temperature = 30

        #expect(logger.readings == [22])
    }
}
