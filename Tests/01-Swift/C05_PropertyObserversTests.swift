import Testing
@testable import Challenges

@Suite("C05 · Property Observers")
struct C05_PropertyObserversTests {
    @Test func clampsHighValues() {
        var volume = VolumeControl()
        volume.level = 15
        #expect(volume.level == 10)
        #expect(volume.history == [5])
    }

    @Test func clampsLowValues() {
        var volume = VolumeControl()
        volume.level = -3
        #expect(volume.level == 0)
    }

    @Test func ignoresNoOpChanges() {
        var volume = VolumeControl()
        volume.level = 10
        volume.level = 12 // clamps back to 10 – no change
        volume.level = 7
        #expect(volume.history == [5, 10])
    }

    @Test func willSetLogsTransitions() {
        let tracker = ProgressTracker()
        tracker.completed = 1
        tracker.completed = 4
        #expect(tracker.log == ["0 → 1", "1 → 4"])
    }
}
