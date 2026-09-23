// Solution · Challenge 64 · Programmatic Navigation

import Foundation
import Observation

enum Route: Hashable {
    case productList
    case product(id: Int)
    case cart
    case checkout
}

@Observable
final class Router {
    var path: [Route] = []

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        _ = path.popLast()
    }

    func popToRoot() {
        path.removeAll()
    }

    func handle(deepLink url: URL) -> Bool {
        guard url.scheme == "shop", let host = url.host() else { return false }
        let components = url.pathComponents.filter { $0 != "/" }

        let newPath: [Route]
        switch (host, components.count) {
        case ("products", 0):
            newPath = [.productList]
        case ("products", 1):
            guard let id = Int(components[0]) else { return false }
            newPath = [.productList, .product(id: id)]
        case ("cart", 0):
            newPath = [.cart]
        case ("checkout", 0):
            newPath = [.cart, .checkout]
        default:
            return false
        }

        path = newPath
        return true
    }
}
