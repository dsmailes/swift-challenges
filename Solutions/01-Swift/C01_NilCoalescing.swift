// Solution · Challenge 01 · Nil Coalescing

func displayName(nickname: String?, fullName: String?) -> String {
    nickname ?? fullName ?? "Anonymous"
}

func score(for player: String, in scores: [String: Int]) -> Int {
    scores[player] ?? 0
}

func port(from environment: [String: String]) -> Int {
    // Int(_:) returns an optional too, so we coalesce twice.
    Int(environment["PORT"] ?? "") ?? 8080
}
