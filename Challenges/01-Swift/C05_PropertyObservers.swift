// ════════════════════════════════════════════════════════════════════════
//  Challenge 05 · Property Observers                           Difficulty ★☆☆
//  Interview question: "What are property observers?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `willSet` runs just before a stored property changes (the incoming value
//  is `newValue`); `didSet` runs just after (the previous value is
//  `oldValue`). Assigning to the property inside its own `didSet` does NOT
//  trigger the observers again, which makes `didSet` handy for clamping.
//
//  YOUR TASK
//  1. `VolumeControl.level`
//     Add a `didSet` observer that:
//       • clamps `level` into 0...10
//       • appends the OLD value to `history`, but only if the (clamped) value
//         actually changed.
//
//  2. `ProgressTracker.completed`
//     Add a `willSet` observer that appends a line to `log` in the format
//     "3 → 4" (old value, space, →, space, new value).
// ════════════════════════════════════════════════════════════════════════

struct VolumeControl {
    var level: Int = 5 // TODO: add didSet

    private(set) var history: [Int] = []
}

final class ProgressTracker {
    var completed: Int = 0 // TODO: add willSet

    private(set) var log: [String] = []
}
