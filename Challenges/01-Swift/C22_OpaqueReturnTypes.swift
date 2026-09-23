// ════════════════════════════════════════════════════════════════════════
//  Challenge 22 · Opaque Return Types                          Difficulty ★★☆
//  Interview question: "What are opaque return types?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `some Protocol` means "one specific concrete type that conforms to
//  Protocol – the compiler knows exactly which, but the caller doesn't need
//  to." Unlike `any Protocol`, every return path must produce the SAME
//  concrete type. SwiftUI's `some View` is the famous example.
//
//  YOUR TASK
//  1. `squares(upTo:)` – return the squares 1, 4, 9 … up to and including
//     `limit` (if limit ≥ 1), as `some Collection<Int>`.
//  2. `makeFormatter(uppercase:)` – return a formatter that either
//     uppercases its input or leaves it alone. Try returning two different
//     structs from the two branches first and read the compiler error – then
//     fix it by returning ONE type that behaves differently based on state.
//     Every formatter should also wrap its output in square brackets:
//        uppercase: true,  "hi" → "[HI]"
//        uppercase: false, "hi" → "[hi]"
// ════════════════════════════════════════════════════════════════════════

protocol TextFormatter {
    func format(_ text: String) -> String
}

struct PassthroughFormatter: TextFormatter {
    func format(_ text: String) -> String { text }
}

func squares(upTo limit: Int) -> some Collection<Int> {
    // TODO
    [Int]()
}

func makeFormatter(uppercase: Bool) -> some TextFormatter {
    // TODO
    PassthroughFormatter()
}
