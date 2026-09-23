// Solution · Challenge 46 · Key-Value Observing (KVO)

import Foundation

final class Thermostat: NSObject {
    @objc dynamic var temperature: Double = 20
}

final class TemperatureLogger {
    private(set) var readings: [Double] = []
    private var observation: NSKeyValueObservation?

    func startObserving(_ thermostat: Thermostat) {
        observation = thermostat.observe(\.temperature, options: [.new]) { [weak self] _, change in
            guard let newValue = change.newValue else { return }
            self?.readings.append(newValue)
        }
    }

    func stopObserving() {
        observation?.invalidate()
        observation = nil
    }
}
