import Testing
@testable import Challenges

@Suite("C73 · Continuations: Bridging Callback APIs")
struct C73_ContinuationsTests {
    let api = LegacyWeatherAPI()

    @Test func temperatures() async throws {
        #expect(try await api.temperature(for: "London") == 18.5)
        await #expect(throws: WeatherError.unknownCity("Atlantis")) {
            try await api.temperature(for: "Atlantis")
        }
    }

    @Test func humidityValues() async throws {
        #expect(try await api.humidity(for: "Oslo") == 0.64)
    }

    @Test func humidityErrors() async {
        await #expect(throws: WeatherError.unknownCity("Atlantis")) {
            try await api.humidity(for: "Atlantis")
        }
        await #expect(throws: WeatherError.noData) {
            try await api.humidity(for: "Cairo")
        }
    }

    @Test func manyCities() async throws {
        let results = try await api.temperatures(for: ["London", "Cairo", "Oslo"])
        #expect(results == ["London": 18.5, "Cairo": 35, "Oslo": 7.25])

        await #expect(throws: WeatherError.self) {
            try await api.temperatures(for: ["London", "Atlantis"])
        }
    }
}
