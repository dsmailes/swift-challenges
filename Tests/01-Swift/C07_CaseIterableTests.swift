import Testing
@testable import Challenges

@Suite("C07 · CaseIterable")
struct C07_CaseIterableTests {
    @Test func nextDay() {
        #expect(Weekday.monday.next == .tuesday)
        #expect(Weekday.sunday.next == .monday)
    }

    @Test func weekend() {
        #expect(Weekday.saturday.isWeekend)
        #expect(Weekday.sunday.isWeekend)
        #expect(!Weekday.friday.isWeekend)
    }

    @Test func workingDays() {
        #expect(Weekday.workingDays == [.monday, .tuesday, .wednesday, .thursday, .friday])
    }

    @Test func abbreviations() {
        #expect(Weekday(abbreviation: "WED") == .wednesday)
        #expect(Weekday(abbreviation: "sun") == .sunday)
        #expect(Weekday(abbreviation: "xyz") == nil)
    }
}
