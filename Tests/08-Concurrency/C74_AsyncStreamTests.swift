import Testing
@testable import Challenges

@Suite("C74 · AsyncSequence & AsyncStream")
struct C74_AsyncStreamTests {
    @Test func countingDown() async {
        var values: [Int] = []
        for await value in countdown(from: 3) {
            values.append(value)
        }
        #expect(values == [3, 2, 1])

        var empty: [Int] = []
        for await value in countdown(from: 0) { empty.append(value) }
        #expect(empty.isEmpty)
    }

    @Test func sensorStreamDeliversReadings() async {
        let sensor = TemperatureSensor()
        let stream = sensor.readings()
        #expect(sensor.isRunning)

        sensor.emit(20)
        sensor.emit(22)
        sensor.emit(24)
        sensor.emit(99) // ignored – we only read 3

        #expect(await average(ofFirst: 3, in: stream) == 22)
    }

    @Test func sensorStopsWhenConsumerGoesAway() async {
        let sensor = TemperatureSensor()
        do {
            let stream = sensor.readings()
            sensor.emit(1)
            _ = await average(ofFirst: 1, in: stream)
        }
        #expect(!sensor.isRunning)
        #expect(sensor.onReading == nil)
    }

    @Test func sensorStopsWhenConsumerIsCancelled() async throws {
        let sensor = TemperatureSensor()
        let stream = sensor.readings()
        let consumer = Task {
            for await _ in stream {}
        }
        consumer.cancel()
        await consumer.value
        #expect(!sensor.isRunning)
    }

    @Test func averageOfShortStream() async {
        let finite = AsyncStream<Double> { continuation in
            continuation.yield(4)
            continuation.yield(8)
            continuation.finish()
        }
        #expect(await average(ofFirst: 5, in: finite) == 6)
        #expect(await average(ofFirst: 5, in: AsyncStream { $0.finish() }) == nil)
    }
}
