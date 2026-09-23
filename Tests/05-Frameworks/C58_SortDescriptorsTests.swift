import Foundation
import Testing
@testable import Challenges

@Suite("C58 · Sort Descriptors")
struct C58_SortDescriptorsTests {
    let staff = [
        StaffMember(firstName: "zoe", lastName: "smith", salary: 50_000),
        StaffMember(firstName: "Ada", lastName: "Lovelace", salary: 90_000),
        StaffMember(firstName: "Anna", lastName: "Smith", salary: 70_000),
        StaffMember(firstName: "grace", lastName: "hopper", salary: 85_000),
    ]

    @Test func descriptors() {
        let descriptors = nameSortDescriptors()
        #expect(descriptors.map(\.key) == ["lastName", "firstName"])
        let allAscending = descriptors.allSatisfy { $0.ascending }
        #expect(allAscending)
    }

    @Test func nameOrder() {
        #expect(sortedByName(staff).map(\.description) == ["grace hopper", "Ada Lovelace", "Anna Smith", "zoe smith"])
    }

    @Test func salaryOrder() {
        #expect(sortedBySalaryDescending(staff).map(\.salary) == [90_000, 85_000, 70_000, 50_000])
    }

    @Test func swiftComparatorsMatch() {
        #expect(swiftSortedByName(staff).map(\.description) == ["grace hopper", "Ada Lovelace", "Anna Smith", "zoe smith"])
    }
}
