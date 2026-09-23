// Solution · Challenge 58 · Sort Descriptors

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
    let compare = #selector(NSString.localizedCaseInsensitiveCompare(_:))
    return [
        NSSortDescriptor(key: #keyPath(StaffMember.lastName), ascending: true, selector: compare),
        NSSortDescriptor(key: #keyPath(StaffMember.firstName), ascending: true, selector: compare),
    ]
}

func sortedByName(_ staff: [StaffMember]) -> [StaffMember] {
    (staff as NSArray).sortedArray(using: nameSortDescriptors()) as! [StaffMember]
}

func sortedBySalaryDescending(_ staff: [StaffMember]) -> [StaffMember] {
    let descriptor = NSSortDescriptor(key: #keyPath(StaffMember.salary), ascending: false)
    return (staff as NSArray).sortedArray(using: [descriptor]) as! [StaffMember]
}

func swiftSortedByName(_ staff: [StaffMember]) -> [StaffMember] {
    let caseInsensitive = String.Comparator(options: .caseInsensitive)
    return staff.sorted(using: [
        KeyPathComparator(\.lastName, comparator: caseInsensitive),
        KeyPathComparator(\.firstName, comparator: caseInsensitive),
    ])
}
