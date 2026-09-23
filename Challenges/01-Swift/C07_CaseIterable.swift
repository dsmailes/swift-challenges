// ════════════════════════════════════════════════════════════════════════
//  Challenge 07 · CaseIterable                                 Difficulty ★☆☆
//  Interview question: "What does the `CaseIterable` protocol do?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Conforming an enum without associated values to `CaseIterable` makes Swift
//  synthesize a static `allCases` collection containing every case, in
//  declaration order.
//
//  YOUR TASK
//  Using `allCases` (don't hard-code a switch!):
//  1. `next` – the following weekday, wrapping from `.sunday` to `.monday`.
//  2. `isWeekend` – true for Saturday and Sunday.
//  3. `workingDays` – every day that isn't the weekend, in order.
//  4. `init?(abbreviation:)` – match the first three letters of the raw value
//     case-insensitively, e.g. "WED" → .wednesday. Return nil otherwise.
// ════════════════════════════════════════════════════════════════════════

enum Weekday: String, CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    var next: Weekday {
        // TODO
        self
    }

    var isWeekend: Bool {
        // TODO
        false
    }

    static var workingDays: [Weekday] {
        // TODO
        []
    }

    init?(abbreviation: String) {
        // TODO
        return nil
    }
}
