// Solution · Challenge 05 · Property Observers

struct VolumeControl {
    var level: Int = 5 {
        didSet {
            // Re-assigning inside didSet does not re-trigger the observer.
            level = min(max(level, 0), 10)
            if level != oldValue {
                history.append(oldValue)
            }
        }
    }

    private(set) var history: [Int] = []
}

final class ProgressTracker {
    var completed: Int = 0 {
        willSet {
            log.append("\(completed) → \(newValue)")
        }
    }

    private(set) var log: [String] = []
}
