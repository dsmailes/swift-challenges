// ════════════════════════════════════════════════════════════════════════
//  Challenge 74 · AsyncSequence & AsyncStream                  Difficulty ★★★
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  An `AsyncSequence` delivers values over time; you consume it with
//  `for await value in sequence { … }`. `AsyncStream` is the easiest way to
//  make one – especially to adapt callback/delegate-based APIs that produce
//  MANY values (a continuation, C73, can only resume once):
//
//      AsyncStream { continuation in
//          continuation.yield(1)
//          continuation.yield(2)
//          continuation.finish()
//          continuation.onTermination = { _ in /* clean up */ }
//      }
//
//  `onTermination` runs when the stream finishes, or when the consumer stops
//  listening (breaks out of the loop, gets cancelled, or drops the stream) –
//  the right place to stop the underlying producer.
//
//  YOUR TASK
//  1. `countdown(from:)` – a stream that yields n, n-1, … 1 and then
//     finishes. (An empty stream for n ≤ 0.)
//  2. `TemperatureSensor.readings()` – adapt the callback-based sensor:
//     set `onReading` to forward each value into the stream, `start()` the
//     sensor, and `stop()` it (and clear `onReading`) in `onTermination`.
//  3. `average(ofFirst:in:)` – consume the first `count` values of any
//     stream of Doubles and return their mean, or nil if the stream ends
//     before any value arrives. Stop reading once you have enough!
// ════════════════════════════════════════════════════════════════════════

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
    // TODO
    AsyncStream { $0.finish() }
}

extension TemperatureSensor {
    func readings() -> AsyncStream<Double> {
        // TODO
        AsyncStream { $0.finish() }
    }
}

func average(ofFirst count: Int, in stream: AsyncStream<Double>) async -> Double? {
    // TODO
    nil
}
