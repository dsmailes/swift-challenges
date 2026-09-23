// ════════════════════════════════════════════════════════════════════════
//  Challenge 58 · Sort Descriptors                             Difficulty ★★☆
//  Interview question: "When might you use `NSSortDescriptor`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `NSSortDescriptor` describes a sort order – a key, a direction, and
//  optionally a comparison selector – as a value you can store, combine, and
//  hand to APIs such as Core Data fetch requests, `NSArray`, and
//  `NSArrayController`. Because it uses key-value coding, the sorted
//  properties must be `@objc`. In pure Swift, `KeyPathComparator` /
//  `SortDescriptor` play the same role.
//
//  YOUR TASK
//  1. `nameSortDescriptors()` – sort by last name, then first name,
//     ascending, comparing with `localizedCaseInsensitiveCompare(_:)` so
//     "smith" and "Smith" count as the same last name.
//  2. `sortedByName(_:)` – apply those descriptors via
//     `NSArray.sortedArray(using:)`.
//  3. `sortedBySalaryDescending(_:)` – highest salary first, using an
//     NSSortDescriptor.
//  4. `swiftSortedByName(_:)` – same order as #2 but using Swift's
//     `sorted(using:)` with `KeyPathComparator`s. Pass a case-insensitive
//     `String.Comparator(options: .caseInsensitive)`.
// ════════════════════════════════════════════════════════════════════════

import Foundation

final class StaffMember: NSObject {
    @objc let firstName: String
    @objc let lastName: String
    @objc let salary: Int

    init(firstName: String, lastName: String, salary: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.salary = salary
    }

    override var description: String { "\(firstName) \(lastName)" }
}

func nameSortDescriptors() -> [NSSortDescriptor] {
    // TODO
    []
}

func sortedByName(_ staff: [StaffMember]) -> [StaffMember] {
    // TODO
    staff
}

func sortedBySalaryDescending(_ staff: [StaffMember]) -> [StaffMember] {
    // TODO
    staff
}

func swiftSortedByName(_ staff: [StaffMember]) -> [StaffMember] {
    // TODO
    staff
}
