// ════════════════════════════════════════════════════════════════════════
//  Challenge 23 · Result Builders                              Difficulty ★★★
//  Interview question: "What are result builders and when are they used in
//  Swift?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A result builder turns a sequence of statements into a single value. It's
//  how SwiftUI's view bodies work. The compiler rewrites your closure into
//  calls to static methods:
//    • buildExpression – converts each line into a component
//    • buildBlock      – combines the components of a block
//    • buildOptional   – `if` without `else`
//    • buildEither     – `if/else` and `switch`
//    • buildArray      – `for … in` loops
//
//  YOUR TASK
//  Implement every method of `ChecklistBuilder` so this works:
//
//      let list = Checklist {
//          "Pack passport"
//          if needsVisa { "Apply for visa" }
//          for city in cities { "Book hotel in \(city)" }
//      }
//
//  Each component is a `[String]`. Every method currently returns [] – make
//  them combine/forward their inputs properly. Then make `Checklist.init`
//  store the built items.
// ════════════════════════════════════════════════════════════════════════

@resultBuilder
enum ChecklistBuilder {
    static func buildExpression(_ expression: String) -> [String] {
        [] // TODO
    }

    static func buildBlock(_ components: [String]...) -> [String] {
        [] // TODO
    }

    static func buildOptional(_ component: [String]?) -> [String] {
        [] // TODO
    }

    static func buildEither(first component: [String]) -> [String] {
        [] // TODO
    }

    static func buildEither(second component: [String]) -> [String] {
        [] // TODO
    }

    static func buildArray(_ components: [[String]]) -> [String] {
        [] // TODO
    }
}

struct Checklist {
    let items: [String]

    init(@ChecklistBuilder _ content: () -> [String]) {
        items = [] // TODO
    }
}
