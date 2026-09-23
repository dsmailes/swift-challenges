import Foundation
import Testing
@testable import Challenges

@Suite("C64 · Programmatic Navigation")
struct C64_ProgrammaticNavigationTests {
    @Test func pushAndPop() {
        let router = Router()
        router.push(.productList)
        router.push(.product(id: 1))
        #expect(router.path == [.productList, .product(id: 1)])
        router.pop()
        #expect(router.path == [.productList])
        router.pop()
        router.pop()
        #expect(router.path.isEmpty)
    }

    @Test func popToRoot() {
        let router = Router()
        router.push(.cart)
        router.push(.checkout)
        router.popToRoot()
        #expect(router.path.isEmpty)
    }

    @Test(arguments: [
        ("shop://products", [Route.productList]),
        ("shop://products/42", [.productList, .product(id: 42)]),
        ("shop://cart", [.cart]),
        ("shop://checkout", [.cart, .checkout]),
    ])
    func validDeepLinks(link: String, expected: [Route]) {
        let router = Router()
        router.push(.productList)
        #expect(router.handle(deepLink: URL(string: link)!))
        #expect(router.path == expected)
    }

    @Test(arguments: ["https://products/42", "shop://products/abc", "shop://unknown", "shop://cart/extra"])
    func invalidDeepLinks(link: String) {
        let router = Router()
        router.push(.cart)
        #expect(!router.handle(deepLink: URL(string: link)!))
        #expect(router.path == [.cart])
    }
}
