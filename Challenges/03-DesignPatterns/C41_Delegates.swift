// ════════════════════════════════════════════════════════════════════════
//  Challenge 41 · Delegation                                   Difficulty ★★☆
//  Interview question: "How would you explain delegates to a new Swift
//  developer?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Delegation lets one object hand off decisions or notifications to another
//  object that conforms to a protocol. UIKit uses it everywhere
//  (UITableViewDelegate, UITextFieldDelegate…). Delegate properties are
//  almost always `weak`, because the delegate usually owns the object that
//  holds the reference – a strong reference would create a retain cycle.
//
//  YOUR TASK
//  1. Fix `delegate` so it doesn't keep its delegate alive. (What does the
//     protocol need for `weak` to be allowed?)
//  2. `start()` – tell the delegate the download started.
//  3. `receive(bytes:)` – add to `receivedBytes` (never exceeding
//     `totalBytes`), report progress as a fraction 0...1, and when the
//     download completes call `downloadDidFinish` exactly ONCE. Ignore bytes
//     received after completion.
// ════════════════════════════════════════════════════════════════════════

protocol DownloadDelegate {
    func downloadDidStart(_ download: FileDownload)
    func download(_ download: FileDownload, didUpdateProgress progress: Double)
    func downloadDidFinish(_ download: FileDownload)
}

final class FileDownload {
    var delegate: DownloadDelegate? // TODO: should not keep the delegate alive
    let totalBytes: Int
    private(set) var receivedBytes = 0

    init(totalBytes: Int) {
        self.totalBytes = totalBytes
    }

    func start() {
        // TODO
    }

    func receive(bytes: Int) {
        // TODO
    }
}
