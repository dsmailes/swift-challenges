// Solution · Challenge 23 · Result Builders

@resultBuilder
enum ChecklistBuilder {
    static func buildExpression(_ expression: String) -> [String] {
        [expression]
    }

    static func buildBlock(_ components: [String]...) -> [String] {
        components.flatMap { $0 }
    }

    static func buildOptional(_ component: [String]?) -> [String] {
        component ?? []
    }

    static func buildEither(first component: [String]) -> [String] {
        component
    }

    static func buildEither(second component: [String]) -> [String] {
        component
    }

    static func buildArray(_ components: [[String]]) -> [String] {
        components.flatMap { $0 }
    }
}

struct Checklist {
    let items: [String]

    init(@ChecklistBuilder _ content: () -> [String]) {
        items = content()
    }
}
