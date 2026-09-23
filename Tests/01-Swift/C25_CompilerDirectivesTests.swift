import Testing
@testable import Challenges

/// These tests run on macOS in a Debug build with Swift 6.
@Suite("C25 · Compiler Directives & Availability")
struct C25_CompilerDirectivesTests {
    @Test func platform() {
        #expect(BuildInfo.platformName == "macOS")
        #expect(!BuildInfo.isSimulator)
    }

    @Test func imports() {
        #expect(BuildInfo.hasCryptoKit)
    }

    @Test func languageVersion() {
        #expect(BuildInfo.isSwift6OrLater)
    }

    @Test func debug() {
        #expect(BuildInfo.isDebugBuild)
    }

    @Test func availability() {
        #expect(BuildInfo.supportsMacOS15APIs())
    }
}
