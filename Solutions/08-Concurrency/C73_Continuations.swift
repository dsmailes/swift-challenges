// Solution · Challenge 73 · Continuations: Bridging Callback APIs

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
        try await withCheckedThrowingContinuation { continuation in
            fetchTemperature(for: city) { result in
                continuation.resume(with: result)
            }
        }
    }

    func humidity(for city: String) async throws -> Double {
        try await withCheckedThrowingContinuation { continuation in
            fetchHumidity(for: city) { value, error in
                // Exactly one resume on every path.
                if let value {
                    continuation.resume(returning: value)
                } else if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: WeatherError.noData)
                }
            }
        }
    }

    func temperatures(for cities: [String]) async throws -> [String: Double] {
        try await withThrowingTaskGroup(of: (String, Double).self) { group in
            for city in cities {
                group.addTask { (city, try await self.temperature(for: city)) }
            }
            return try await group.reduce(into: [:]) { $0[$1.0] = $1.1 }
        }
    }
}
