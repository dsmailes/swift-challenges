// ════════════════════════════════════════════════════════════════════════
//  Challenge 53 · Listing Files with FileManager               Difficulty ★★☆
//  Interview question: "What class would you use to list files in a
//  directory?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  `FileManager` handles the file system: `contentsOfDirectory(at:…)` lists
//  one level, `enumerator(at:…)` walks recursively, and URL resource values
//  (`.isRegularFileKey`, `.fileSizeKey`) give you metadata efficiently.
//
//  YOUR TASK
//  1. `fileNames(in:withExtension:)` – names of the files directly inside
//     `directory` whose extension matches (case-insensitively), sorted
//     alphabetically. Don't include subdirectories or hidden files.
//  2. `totalSize(ofFilesIn:)` – the sum of the sizes (in bytes) of every
//     regular file inside `directory`, INCLUDING subdirectories.
// ════════════════════════════════════════════════════════════════════════

import Foundation

func fileNames(in directory: URL, withExtension fileExtension: String) throws -> [String] {
    // TODO
    []
}

func totalSize(ofFilesIn directory: URL) throws -> Int {
    // TODO
    0
}
