// ════════════════════════════════════════════════════════════════════════
//  Challenge 01 · Nil Coalescing                               Difficulty ★☆☆
//  Interview question: "What does the nil coalescing operator do?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `a ?? b` unwraps `a` if it has a value, otherwise it evaluates and returns
//  `b`. The operator can be chained (`a ?? b ?? c`), and the right-hand side
//  is only evaluated when it's needed.
//
//  YOUR TASK
//  Implement each function below using `??` – no `if let`, `guard`, or
//  `switch` allowed!
//
//  1. `displayName(nickname:fullName:)`
//     Return the nickname if there is one, otherwise the full name, otherwise
//     the string "Anonymous".
//
//  2. `score(for:in:)`
//     Return the player's score from the dictionary, or 0 if they have none.
//
//  3. `port(from:)`
//     Read the "PORT" key from an environment dictionary and convert it to an
//     `Int`. If the key is missing OR isn't a valid integer, return 8080.
//
//  Run the tests with ⌘U, or click the diamond next to `C01_NilCoalescingTests`.
// ════════════════════════════════════════════════════════════════════════

func displayName(nickname: String?, fullName: String?) -> String {
    // TODO
    return ""
}

func score(for player: String, in scores: [String: Int]) -> Int {
    // TODO
    return -1
}

func port(from environment: [String: String]) -> Int {
    // TODO
    return 0
}
