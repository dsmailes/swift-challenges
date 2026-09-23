// ════════════════════════════════════════════════════════════════════════
//  Challenge 02 · Optional Chaining                            Difficulty ★☆☆
//  Interview question: "What problem does optional chaining solve?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Optional chaining (`a?.b?.c`) lets you reach through several optional
//  values in a single expression. If any link in the chain is nil, the whole
//  expression becomes nil instead of crashing – and the result is always
//  optional, even if the final property isn't.
//
//  The model types below are already written for you.
//
//  YOUR TASK
//  Implement the three functions using optional chaining (combine with `??`
//  where it helps). Each should be a single expression.
//
//  1. `headquartersCity(of:)` – the city of the worker's employer's HQ,
//     or nil if any part is missing.
//  2. `postcodeLength(of:)` – the number of characters in the HQ postcode,
//     or nil if any part is missing.
//  3. `shoutedEmployerName(of:)` – the employer's name uppercased, or
//     "UNEMPLOYED" if the worker has no employer.
// ════════════════════════════════════════════════════════════════════════

struct Address {
    var city: String
    var postcode: String?
}

struct Company {
    var name: String
    var headquarters: Address?
}

struct Worker {
    var name: String
    var employer: Company?
}

func headquartersCity(of worker: Worker) -> String? {
    // TODO
    return nil
}

func postcodeLength(of worker: Worker) -> Int? {
    // TODO
    return nil
}

func shoutedEmployerName(of worker: Worker) -> String {
    // TODO
    return ""
}
