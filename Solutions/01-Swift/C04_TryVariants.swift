// Solution · Challenge 04 · try, try?, and try!

enum ConfigError: Error, Equatable {
    case missingValue(String)
    case invalidNumber(String)
}

func requireValue(_ key: String, in config: [String: String]) throws -> String {
    guard let value = config[key] else {
        throw ConfigError.missingValue(key)
    }
    return value
}

func requireInt(_ key: String, in config: [String: String]) throws -> Int {
    let text = try requireValue(key, in: config)
    guard let number = Int(text) else {
        throw ConfigError.invalidNumber(key)
    }
    return number
}

func optionalInt(_ key: String, in config: [String: String]) -> Int? {
    try? requireInt(key, in: config)
}

func timeout(in config: [String: String]) -> Int {
    (try? requireInt("timeout", in: config)) ?? 30
}

func defaultRetryCount() -> Int {
    // Safe: the input is a hard-coded literal we control.
    try! requireInt("retries", in: ["retries": "3"])
}
