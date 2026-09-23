import Testing
@testable import Challenges

@Suite("C02 · Optional Chaining")
struct C02_OptionalChainingTests {
    let fullyKnown = Worker(
        name: "Ada",
        employer: Company(name: "Analytical Engines", headquarters: Address(city: "London", postcode: "SW1A 1AA"))
    )
    let noPostcode = Worker(
        name: "Grace",
        employer: Company(name: "Navy", headquarters: Address(city: "Arlington", postcode: nil))
    )
    let noHQ = Worker(name: "Linus", employer: Company(name: "Remote Co", headquarters: nil))
    let unemployed = Worker(name: "Alan", employer: nil)

    @Test func city() {
        #expect(headquartersCity(of: fullyKnown) == "London")
        #expect(headquartersCity(of: noHQ) == nil)
        #expect(headquartersCity(of: unemployed) == nil)
    }

    @Test func postcode() {
        #expect(postcodeLength(of: fullyKnown) == 8)
        #expect(postcodeLength(of: noPostcode) == nil)
        #expect(postcodeLength(of: unemployed) == nil)
    }

    @Test func employerName() {
        #expect(shoutedEmployerName(of: noHQ) == "REMOTE CO")
        #expect(shoutedEmployerName(of: unemployed) == "UNEMPLOYED")
    }
}
