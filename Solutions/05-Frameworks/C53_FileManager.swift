// Solution · Challenge 53 · Listing Files with FileManager

import Foundation

func fileNames(in directory: URL, withExtension fileExtension: String) throws -> [String] {
    let contents = try FileManager.default.contentsOfDirectory(
        at: directory,
        includingPropertiesForKeys: [.isRegularFileKey],
        options: [.skipsHiddenFiles]
    )

    return try contents
        .filter { try $0.resourceValues(forKeys: [.isRegularFileKey]).isRegularFile == true }
        .filter { $0.pathExtension.caseInsensitiveCompare(fileExtension) == .orderedSame }
        .map(\.lastPathComponent)
        .sorted()
}

func totalSize(ofFilesIn directory: URL) throws -> Int {
    let keys: Set<URLResourceKey> = [.isRegularFileKey, .fileSizeKey]
    guard let enumerator = FileManager.default.enumerator(at: directory, includingPropertiesForKeys: Array(keys)) else {
        return 0
    }

    var total = 0
    for case let url as URL in enumerator {
        let values = try url.resourceValues(forKeys: keys)
        if values.isRegularFile == true {
            total += values.fileSize ?? 0
        }
    }
    return total
}
