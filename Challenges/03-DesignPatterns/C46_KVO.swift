// ════════════════════════════════════════════════════════════════════════
//  Challenge 46 · Key-Value Observing (KVO)                    Difficulty ★★☆
//  Interview question: "Can you explain KVO, and how it's used on Apple's
//  platforms?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  KVO is an Objective-C runtime feature that notifies you when a property
//  changes. In Swift, the observed class must inherit from `NSObject` and the
//  property must be marked `@objc dynamic`. `observe(_:options:changeHandler:)`
//  returns an `NSKeyValueObservation` token – observation stops when that
//  token is invalidated or deallocated, so you must keep it alive.
//  (AVPlayer, WKWebView, and Operation all expose KVO-observable properties.)
//
//  YOUR TASK
//  1. Make `Thermostat.temperature` observable via KVO.
//     ⚠️ If you observe it without `@objc dynamic` the app will crash!
//  2. `TemperatureLogger.startObserving(_:)` – observe `temperature` with
//     the `.new` option and append each new value to `readings`. Store the
//     observation token.
//  3. `stopObserving()` – invalidate the token and set it to nil; later
//     changes must not be recorded.
// ════════════════════════════════════════════════════════════════════════

import Foundation

final class Thermostat: NSObject {
    var temperature: Double = 20 // TODO: make KVO-observable
}

final class TemperatureLogger {
    private(set) var readings: [Double] = []
    private var observation: NSKeyValueObservation?

    func startObserving(_ thermostat: Thermostat) {
        // TODO
    }

    func stopObserving() {
        // TODO
    }
}
