// Solution · Challenge 74 · AsyncSequence & AsyncStream

import Synchronization

/// A callback-based sensor (pretend this is a hardware SDK you can't change).
final class TemperatureSensor: Sendable {
    private struct State {
        var handler: (@Sendable (Double) -> Void)?
        var isRunning = false
    }

    private let state = Mutex(State())

    init() {}

    var onReading: (@Sendable (Double) -> Void)? {
        get { state.withLock { $0.handler } }
        set { state.withLock { $0.handler = newValue } }
    }

    var isRunning: Bool { state.withLock { $0.isRunning } }

    func start() { state.withLock { $0.isRunning = true } }
    func stop() { state.withLock { $0.isRunning = false } }

    /// Simulates the hardware producing a reading.
    func emit(_ value: Double) {
        let handler = state.withLock { $0.isRunning ? $0.handler : nil }
        handler?(value)
    }
}

func countdown(from start: Int) -> AsyncStream<Int> {
    AsyncStream { continuation in
        for value in stride(from: start, through: 1, by: -1) {
            continuation.yield(value)
        }
        continuation.finish()
    }
}

extension TemperatureSensor {
    func readings() -> AsyncStream<Double> {
        AsyncStream { continuation in
            onReading = { value in
                continuation.yield(value)
            }
            continuation.onTermination = { _ in
                self.stop()
                self.onReading = nil
            }
            start()
        }
    }
}

func average(ofFirst count: Int, in stream: AsyncStream<Double>) async -> Double? {
    var total = 0.0
    var received = 0

    for await value in stream {
        total += value
        received += 1
        if received == count { break }
    }

    return received == 0 ? nil : total / Double(received)
}
