import Testing
@testable import Challenges

@MainActor
@Suite("C47 · Singletons", .serialized)
struct C47_SingletonsTests {
    init() {
        AppSettings.shared.reset()
    }

    @Test func sharedIsSingleInstance() {
        #expect(AppSettings.shared === AppSettings.shared)
    }

    @Test func stateIsShared() {
        AppSettings.shared.theme = "dark"
        AppSettings.shared.recordLaunch()
        AppSettings.shared.recordLaunch()
        #expect(AppSettings.shared.theme == "dark")
        #expect(AppSettings.shared.launchCount == 2)
    }

    @Test func resetting() {
        AppSettings.shared.theme = "light"
        AppSettings.shared.recordLaunch()
        AppSettings.shared.reset()
        #expect(AppSettings.shared.theme == "system")
        #expect(AppSettings.shared.launchCount == 0)
    }
}
