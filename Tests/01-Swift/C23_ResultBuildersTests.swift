import Testing
@testable import Challenges

@Suite("C23 · Result Builders")
struct C23_ResultBuildersTests {
    @Test func plainStatements() {
        let list = Checklist {
            "Pack passport"
            "Charge phone"
        }
        #expect(list.items == ["Pack passport", "Charge phone"])
    }

    @Test(arguments: [true, false])
    func optionalStatements(needsVisa: Bool) {
        let list = Checklist {
            "Pack passport"
            if needsVisa {
                "Apply for visa"
            }
        }
        #expect(list.items == (needsVisa ? ["Pack passport", "Apply for visa"] : ["Pack passport"]))
    }

    @Test(arguments: [true, false])
    func eitherStatements(isWinter: Bool) {
        let list = Checklist {
            if isWinter {
                "Pack coat"
            } else {
                "Pack sunscreen"
            }
        }
        #expect(list.items == [isWinter ? "Pack coat" : "Pack sunscreen"])
    }

    @Test func loops() {
        let cities = ["Rome", "Paris"]
        let list = Checklist {
            "Book flights"
            for city in cities {
                "Book hotel in \(city)"
            }
        }
        #expect(list.items == ["Book flights", "Book hotel in Rome", "Book hotel in Paris"])
    }
}
