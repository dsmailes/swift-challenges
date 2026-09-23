import Foundation
import Testing
@testable import Challenges

@Suite("C66 · async/await and async let")
struct C66_AsyncAwaitTests {
    struct WeatherUnavailable: Error {}

    struct MockService: DashboardService {
        let probe = ConcurrencyProbe()
        var failWeather = false

        func fetchUsername(id: Int) async throws -> String {
            try await probe.measure("user\(id)")
        }

        func fetchUnreadCount(userID: Int) async throws -> Int {
            try await probe.measure(userID * 2)
        }

        func fetchWeather() async throws -> String {
            if failWeather { throw WeatherUnavailable() }
            return try await probe.measure("Sunny")
        }

        func fetchAvatarURL(username: String) async throws -> URL {
            try await probe.measure(URL(string: "https://example.com/\(username).png")!)
        }
    }

    @Test func dashboardValues() async throws {
        let dashboard = try await loadDashboard(userID: 7, service: MockService())
        #expect(dashboard == Dashboard(username: "user7", unreadCount: 14, weather: "Sunny"))
    }

    @Test func dashboardFetchesInParallel() async throws {
        let service = MockService()
        _ = try await loadDashboard(userID: 1, service: service)
        #expect(await service.probe.maximum == 3, "All three fetches should be in flight together")
    }

    @Test func avatarIsSequential() async throws {
        let service = MockService()
        let url = try await loadAvatar(userID: 3, service: service)
        #expect(url.absoluteString == "https://example.com/user3.png")
        #expect(await service.probe.calls == 2)
        #expect(await service.probe.maximum == 1)
    }

    @Test func errorsPropagate() async {
        await #expect(throws: WeatherUnavailable.self) {
            try await loadDashboard(userID: 1, service: MockService(failWeather: true))
        }
    }
}
