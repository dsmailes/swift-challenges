// Solution · Challenge 07 · CaseIterable

enum Weekday: String, CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    var next: Weekday {
        let all = Self.allCases
        let index = all.firstIndex(of: self)!
        return all[(index + 1) % all.count]
    }

    var isWeekend: Bool {
        self == .saturday || self == .sunday
    }

    static var workingDays: [Weekday] {
        allCases.filter { !$0.isWeekend }
    }

    init?(abbreviation: String) {
        let lowered = abbreviation.lowercased()
        guard lowered.count == 3,
              let match = Self.allCases.first(where: { $0.rawValue.hasPrefix(lowered) })
        else { return nil }
        self = match
    }
}
