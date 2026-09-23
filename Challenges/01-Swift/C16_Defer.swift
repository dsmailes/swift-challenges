// ════════════════════════════════════════════════════════════════════════
//  Challenge 16 · defer                                        Difficulty ★★☆
//  Interview question: "When would you use the `defer` keyword in Swift?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Code inside `defer { }` runs when the current scope exits – however it
//  exits: a normal return, an early return, or a thrown error. That makes it
//  perfect for cleanup. Multiple defers run in REVERSE order.
//
//  YOUR TASK
//  1. `processFile(named:contents:log:)`
//       • append "open <name>" to the log
//       • use defer so that "close <name>" is ALWAYS appended when the function
//         exits – even when it throws
//       • if `contents` is empty, throw `FileProcessingError.emptyFile`
//       • otherwise append "read <n> chars" and return n
//
//  2. `runSteps(log:)` – append "start", then register two defers that append
//     "cleanup 1" and "cleanup 2" (in that order in your source), then append
//     "work". Predict the final log before running the test!
// ════════════════════════════════════════════════════════════════════════

final class EventLog {
    var entries: [String] = []
}

enum FileProcessingError: Error {
    case emptyFile
}

func processFile(named name: String, contents: String, log: EventLog) throws -> Int {
    // TODO
    0
}

func runSteps(log: EventLog) {
    // TODO
}
