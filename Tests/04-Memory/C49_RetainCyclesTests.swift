import Testing
@testable import Challenges

@Suite("C49 · Retain Cycles & ARC")
struct C49_RetainCyclesTests {
    final class DeinitLog {
        var names: [String] = []
    }

    @Test func tenantAndApartmentAreFreed() {
        let log = DeinitLog()
        do {
            let tenant = Tenant(name: "Ada")
            let apartment = Apartment(unit: "4B")
            tenant.onDeinit = { log.names.append("tenant") }
            apartment.onDeinit = { log.names.append("apartment") }
            tenant.apartment = apartment
            apartment.tenant = tenant
        }
        #expect(log.names.sorted() == ["apartment", "tenant"])
    }

    @Test func apartmentStillKnowsLivingTenant() {
        let tenant = Tenant(name: "Ada")
        let apartment = Apartment(unit: "4B")
        tenant.apartment = apartment
        apartment.tenant = tenant
        #expect(apartment.tenant?.name == "Ada")
    }

    @Test func treeIsFreed() {
        let log = DeinitLog()
        do {
            let root = TreeNode(value: "root")
            let child = TreeNode(value: "child")
            root.onDeinit = { log.names.append("root") }
            child.onDeinit = { log.names.append("child") }
            root.add(child)
            #expect(child.parent === root)
        }
        #expect(log.names.sorted() == ["child", "root"])
    }
}
