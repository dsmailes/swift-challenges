import Testing
@testable import Challenges

@Suite("C76 · Unstructured Tasks: A Debouncer")
struct C76_UnstructuredTasksTests {
    @Test func onlyLastActionInBurstRuns() async throws {
        let debouncer = AsyncDebouncer(delay: .milliseconds(50))
        let log = Recorder<Int>()

        for index in 0..<5 {
            await debouncer.submit { await log.append(index) }
        }
        try await Task.sleep(for: .milliseconds(300))

        #expect(await log.items == [4])
    }

    @Test func separateBurstsEachRun() async throws {
        let debouncer = AsyncDebouncer(delay: .milliseconds(40))
        let log = Recorder<String>()

        await debouncer.submit { await log.append("sw") }
        await debouncer.submit { await log.append("swift") }
        try await Task.sleep(for: .milliseconds(250))
        await debouncer.submit { await log.append("swiftui") }
        try await Task.sleep(for: .milliseconds(250))

        #expect(await log.items == ["swift", "swiftui"])
    }

    @Test func cancelPreventsAction() async throws {
        let debouncer = AsyncDebouncer(delay: .milliseconds(50))
        let log = Recorder<Int>()

        await debouncer.submit { await log.append(1) }
        await debouncer.cancel()
        try await Task.sleep(for: .milliseconds(200))

        #expect(await log.items.isEmpty)
    }
}
