// ════════════════════════════════════════════════════════════════════════
//  Challenge 51 · Memory Leaks from Closures                   Difficulty ★★☆
//  Interview question: "What steps do you take to identify and resolve a
//  memory leak?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  The most common leak in modern Swift isn't two objects – it's an object
//  that stores a closure which captures `self` strongly. The object owns the
//  closure, the closure owns the object: a cycle. Fix it with a capture list:
//  `{ [weak self] in … }` (or `[unowned self]` when you're certain).
//
//  To find leaks: watch for missing `deinit` calls, use Xcode's Memory Graph
//  Debugger, Instruments' Leaks / Allocations templates, and tests like the
//  ones below.
//
//  YOUR TASK
//  Both classes leak. Fix them without changing their public API:
//  1. `ProfileViewModel.setUp()` stores a formatter closure that captures
//     self. The formatter should return "Name: <name>" while the view model
//     is alive, and "" if it has gone away.
//  2. `SearchController` owns a `debouncer` that stores a callback – which
//     captures the controller.
// ════════════════════════════════════════════════════════════════════════

final class ProfileViewModel {
    var name: String
    private(set) var formatter: (() -> String)?
    var onDeinit: (() -> Void)?

    init(name: String) { self.name = name }
    deinit { onDeinit?() }

    func setUp() {
        // TODO: this leaks
        formatter = {
            "Name: \(self.name)"
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
        // TODO: this leaks
        debouncer.schedule {
            self.searchCount += 1
        }
    }
}
