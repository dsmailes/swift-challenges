// Solution · Challenge 18 · @autoclosure

final class DebugLogger {
    var isEnabled: Bool
    private(set) var messages: [String] = []

    init(isEnabled: Bool) {
        self.isEnabled = isEnabled
    }

    func log(_ message: @autoclosure () -> String) {
        guard isEnabled else { return }
        messages.append(message())
    }
}

func valueOrDefault<T>(_ value: T?, _ fallback: @autoclosure () -> T) -> T {
    if let value {
        return value
    }
    return fallback()
}
