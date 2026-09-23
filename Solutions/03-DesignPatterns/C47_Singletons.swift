// Solution · Challenge 47 · Singletons

@MainActor
final class AppSettings {
    static let shared = AppSettings()

    var theme = "system"
    private(set) var launchCount = 0

    private init() {}

    func recordLaunch() {
        launchCount += 1
    }

    func reset() {
        theme = "system"
        launchCount = 0
    }
}
