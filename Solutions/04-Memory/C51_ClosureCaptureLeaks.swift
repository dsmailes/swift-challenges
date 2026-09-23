// Solution · Challenge 51 · Memory Leaks from Closures

final class ProfileViewModel {
    var name: String
    private(set) var formatter: (() -> String)?
    var onDeinit: (() -> Void)?

    init(name: String) { self.name = name }
    deinit { onDeinit?() }

    func setUp() {
        formatter = { [weak self] in
            guard let self else { return "" }
            return "Name: \(name)"
        }
    }
}

final class Debouncer {
    private var action: (() -> Void)?

    func schedule(_ action: @escaping () -> Void) {
        self.action = action
    }

    func fire() {
        action?()
    }
}

final class SearchController {
    let debouncer = Debouncer()
    private(set) var searchCount = 0
    var onDeinit: (() -> Void)?

    deinit { onDeinit?() }

    func queryChanged() {
        debouncer.schedule { [weak self] in
            self?.searchCount += 1
        }
    }
}
