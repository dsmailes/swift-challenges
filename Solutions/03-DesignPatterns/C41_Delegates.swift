// Solution · Challenge 41 · Delegation

// `AnyObject` restricts conformance to classes, which is what allows `weak`.
protocol DownloadDelegate: AnyObject {
    func downloadDidStart(_ download: FileDownload)
    func download(_ download: FileDownload, didUpdateProgress progress: Double)
    func downloadDidFinish(_ download: FileDownload)
}

final class FileDownload {
    weak var delegate: DownloadDelegate?
    let totalBytes: Int
    private(set) var receivedBytes = 0

    init(totalBytes: Int) {
        self.totalBytes = totalBytes
    }

    func start() {
        delegate?.downloadDidStart(self)
    }

    func receive(bytes: Int) {
        guard receivedBytes < totalBytes else { return }

        receivedBytes = min(receivedBytes + bytes, totalBytes)
        delegate?.download(self, didUpdateProgress: Double(receivedBytes) / Double(totalBytes))

        if receivedBytes == totalBytes {
            delegate?.downloadDidFinish(self)
        }
    }
}
