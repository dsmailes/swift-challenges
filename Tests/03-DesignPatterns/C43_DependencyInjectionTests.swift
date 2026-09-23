import Foundation
import Testing
@testable import Challenges

@Suite("C43 · Dependency Injection")
struct C43_DependencyInjectionTests {
    struct FixedDate: DateProvider {
        let now: Date
    }

    var utc: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        return calendar
    }

    func service(atHour hour: Int, minute: Int = 0) -> GreetingService {
        let date = utc.date(from: DateComponents(year: 2025, month: 1, day: 1, hour: hour, minute: minute))!
        return GreetingService(dateProvider: FixedDate(now: date), calendar: utc)
    }

    @Test(arguments: [
        (0, "Good morning, Sam!"),
        (11, "Good morning, Sam!"),
        (12, "Good afternoon, Sam!"),
        (17, "Good afternoon, Sam!"),
        (18, "Good evening, Sam!"),
        (23, "Good evening, Sam!"),
    ])
    func greetings(hour: Int, expected: String) {
        #expect(service(atHour: hour, minute: 59).greeting(for: "Sam") == expected)
    }

    @Test func systemProviderUsesRealClock() {
        #expect(abs(SystemDateProvider().now.timeIntervalSinceNow) < 5)
    }
}
