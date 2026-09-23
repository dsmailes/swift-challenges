// Solution · Challenge 22 · Opaque Return Types

protocol TextFormatter {
    func format(_ text: String) -> String
}

struct PassthroughFormatter: TextFormatter {
    func format(_ text: String) -> String { text }
}

struct BracketFormatter: TextFormatter {
    let uppercase: Bool

    func format(_ text: String) -> String {
        "[\(uppercase ? text.uppercased() : text)]"
    }
}

func squares(upTo limit: Int) -> some Collection<Int> {
    // A lazy collection – callers don't need to know the elaborate type.
    (1...max(limit, 1))
        .lazy
        .map { $0 * $0 }
        .filter { $0 <= limit }
}

func makeFormatter(uppercase: Bool) -> some TextFormatter {
    // Both branches must return the same concrete type.
    BracketFormatter(uppercase: uppercase)
}
