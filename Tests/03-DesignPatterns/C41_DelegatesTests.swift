import Testing
@testable import Challenges

@Suite("C41 · Delegation")
struct C41_DelegatesTests {
    final class SpyDelegate: DownloadDelegate {
        var events: [String] = []

        func downloadDidStart(_ download: FileDownload) {
            events.append("start")
        }

        func download(_ download: FileDownload, didUpdateProgress progress: Double) {
            events.append("progress \(progress)")
        }

        func downloadDidFinish(_ download: FileDownload) {
            events.append("finish")
        }
    }

    @Test func reportsLifecycle() {
        let spy = SpyDelegate()
        let download = FileDownload(totalBytes: 100)
        download.delegate = spy

        download.start()
        download.receive(bytes: 25)
        download.receive(bytes: 100)
        download.receive(bytes: 10)

        #expect(spy.events == ["start", "progress 0.25", "progress 1.0", "finish"])
        #expect(download.receivedBytes == 100)
    }

    @Test func delegateIsWeak() {
        let download = FileDownload(totalBytes: 10)
        weak var weakSpy: SpyDelegate?
        do {
            let spy = SpyDelegate()
            weakSpy = spy
            download.delegate = spy
        }
        #expect(weakSpy == nil, "FileDownload is keeping its delegate alive")
    }
}
