// ════════════════════════════════════════════════════════════════════════
//  Challenge 64 · Programmatic Navigation                      Difficulty ★★☆
//  Interview question: "How would you create programmatic navigation in
//  SwiftUI?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `NavigationStack(path:)` binds the navigation stack to an array (or a
//  `NavigationPath`) of Hashable values. Change the array and SwiftUI pushes
//  or pops screens to match; `.navigationDestination(for:)` decides which
//  view to show for each value. Keeping that array in a router object makes
//  navigation – including deep links – plain, testable logic.
//
//      NavigationStack(path: $router.path) {
//          HomeView()
//              .navigationDestination(for: Route.self) { route in … }
//      }
//
//  YOUR TASK
//  Implement `Router`:
//  • `push(_:)`, `pop()` (no-op when empty), `popToRoot()`
//  • `handle(deepLink:)` – replace the whole path based on a URL and return
//    true, or return false and leave the path untouched if it's invalid:
//        shop://products          → [.productList]
//        shop://products/42       → [.productList, .product(id: 42)]
//        shop://cart              → [.cart]
//        shop://checkout          → [.cart, .checkout]
//    Anything else (other schemes, unknown hosts, non-numeric ids) → false.
//    Hint: `url.scheme`, `url.host()`, `url.pathComponents`.
// ════════════════════════════════════════════════════════════════════════

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
        // TODO
    }

    func pop() {
        // TODO
    }

    func popToRoot() {
        // TODO
    }

    func handle(deepLink url: URL) -> Bool {
        // TODO
        false
    }
}
