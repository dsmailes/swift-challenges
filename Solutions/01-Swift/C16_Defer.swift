// Solution · Challenge 16 · defer

final class EventLog {
    var entries: [String] = []
}

enum FileProcessingError: Error {
    case emptyFile
}

func processFile(named name: String, contents: String, log: EventLog) throws -> Int {
    log.entries.append("open \(name)")
    defer { log.entries.append("close \(name)") }

    guard !contents.isEmpty else {
        throw FileProcessingError.emptyFile
    }

    log.entries.append("read \(contents.count) chars")
    return contents.count
}

func runSteps(log: EventLog) {
    log.entries.append("start")
    defer { log.entries.append("cleanup 1") }
    defer { log.entries.append("cleanup 2") }
    log.entries.append("work")
}
