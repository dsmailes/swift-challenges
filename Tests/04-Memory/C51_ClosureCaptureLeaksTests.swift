import Testing
@testable import Challenges

@Suite("C51 · Memory Leaks from Closures")
struct C51_ClosureCaptureLeaksTests {
    final class Flag {
        var value = false
    }

    @Test func formatterWorksWhileAlive() {
        let viewModel = ProfileViewModel(name: "Ada")
        viewModel.setUp()
        viewModel.name = "Ada Lovelace"
        #expect(viewModel.formatter?() == "Name: Ada Lovelace")
    }

    @Test func viewModelIsFreed() {
        let freed = Flag()
        var formatter: (() -> String)?
        do {
            let viewModel = ProfileViewModel(name: "Ada")
            viewModel.onDeinit = { freed.value = true }
            viewModel.setUp()
            formatter = viewModel.formatter
        }
        #expect(freed.value)
        #expect(formatter?() == "")
    }

    @Test func searchControllerWorks() {
        let controller = SearchController()
        controller.queryChanged()
        controller.debouncer.fire()
        controller.debouncer.fire()
        #expect(controller.searchCount == 2)
    }

    @Test func searchControllerIsFreed() {
        let freed = Flag()
        do {
            let controller = SearchController()
            controller.onDeinit = { freed.value = true }
            controller.queryChanged()
        }
        #expect(freed.value)
    }
}
