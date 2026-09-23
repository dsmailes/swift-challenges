// Solution · Challenge 66 · async/await and async let

import Foundation

protocol DashboardService: Sendable {
    func fetchUsername(id: Int) async throws -> String
    func fetchUnreadCount(userID: Int) async throws -> Int
    func fetchWeather() async throws -> String
    func fetchAvatarURL(username: String) async throws -> URL
}

struct Dashboard: Equatable, Sendable {
    let username: String
    let unreadCount: Int
    let weather: String
}

func loadDashboard(userID: Int, service: some DashboardService) async throws -> Dashboard {
    async let username = service.fetchUsername(id: userID)
    async let unreadCount = service.fetchUnreadCount(userID: userID)
    async let weather = service.fetchWeather()

    return try await Dashboard(username: username, unreadCount: unreadCount, weather: weather)
}

func loadAvatar(userID: Int, service: some DashboardService) async throws -> URL {
    let username = try await service.fetchUsername(id: userID)
    return try await service.fetchAvatarURL(username: username)
}
