// ════════════════════════════════════════════════════════════════════════
//  Challenge 73 · Continuations: Bridging Callback APIs        Difficulty ★★☆
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Lots of existing APIs use completion handlers. A *continuation* wraps one
//  in an async function:
//
//      try await withCheckedThrowingContinuation { continuation in
//          legacyCall { result in
//              continuation.resume(with: result)
//          }
//      }
//
//  The golden rule: resume EXACTLY ONCE on every path. Resuming twice
//  crashes; never resuming leaks the task forever (the "checked" variant logs
//  a warning if you forget). Watch out for Objective-C–style callbacks that
//  hand you `(value?, error?)` – you have to handle the "both nil" case.
//
//  YOUR TASK
//  `LegacyWeatherAPI` is provided (don't change it). Add async versions:
//  1. `temperature(for:)` – wraps the `Result`-based callback.
//  2. `humidity(for:)` – wraps the `(Double?, Error?)` callback:
//       value → return it;  error → throw it;  both nil → throw `.noData`
//  3. `temperatures(for:)` – call your async `temperature(for:)` for every
//     city CONCURRENTLY (task group) and return a dictionary. If any city
//     fails, throw.
// ════════════════════════════════════════════════════════════════════════

import Dispatch

enum WeatherError: Error, Equatable {
    case unknownCity(String)
    case noData
}

final class LegacyWeatherAPI: Sendable {
    private struct Reading {
        let temperature: Double
        let humidity: Double?
    }

    private let readings: [String: Reading] = [
        "London": Reading(temperature: 18.5, humidity: 0.81),
        "Cairo": Reading(temperature: 35, humidity: nil),
        "Oslo": Reading(temperature: 7.25, humidity: 0.64),
    ]

    func fetchTemperature(for city: String, completion: @escaping @Sendable (Result<Double, WeatherError>) -> Void) {
        let reading = readings[city]
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(10)) {
            if let reading {
                completion(.success(reading.temperature))
            } else {
                completion(.failure(.unknownCity(city)))
            }
        }
    }

    func fetchHumidity(for city: String, completion: @escaping @Sendable (Double?, (any Error)?) -> Void) {
        let reading = readings[city]
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(10)) {
            if let reading {
                completion(reading.humidity, nil) // may be (nil, nil)!
            } else {
                completion(nil, WeatherError.unknownCity(city))
            }
        }
    }
}

extension LegacyWeatherAPI {
    func temperature(for city: String) async throws -> Double {
        // TODO
        0
    }

    func humidity(for city: String) async throws -> Double {
        // TODO
        0
    }

    func temperatures(for cities: [String]) async throws -> [String: Double] {
        // TODO
        [:]
    }
}
