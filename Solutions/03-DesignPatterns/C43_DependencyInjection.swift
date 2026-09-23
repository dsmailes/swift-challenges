// Solution · Challenge 43 · Dependency Injection

import Foundation

protocol DateProvider {
    var now: Date { get }
}

struct SystemDateProvider: DateProvider {
    var now: Date { Date() }
}

struct GreetingService {
    private let dateProvider: DateProvider
    private let calendar: Calendar

    init(dateProvider: DateProvider = SystemDateProvider(), calendar: Calendar = .current) {
        self.dateProvider = dateProvider
        self.calendar = calendar
    }

    func greeting(for name: String) -> String {
        let hour = calendar.component(.hour, from: dateProvider.now)
        let partOfDay = switch hour {
        case ..<12: "morning"
        case ..<18: "afternoon"
        default: "evening"
        }
        return "Good \(partOfDay), \(name)!"
    }
}
