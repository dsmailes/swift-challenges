// Solution · Challenge 25 · Compiler Directives & Availability

enum BuildInfo {
    static var platformName: String {
        #if os(macOS)
        "macOS"
        #elseif os(iOS)
        "iOS"
        #elseif os(watchOS)
        "watchOS"
        #elseif os(tvOS)
        "tvOS"
        #elseif os(visionOS)
        "visionOS"
        #else
        "unknown"
        #endif
    }

    static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        true
        #else
        false
        #endif
    }

    static var hasCryptoKit: Bool {
        #if canImport(CryptoKit)
        true
        #else
        false
        #endif
    }

    static var isSwift6OrLater: Bool {
        #if swift(>=6.0)
        true
        #else
        false
        #endif
    }

    static var isDebugBuild: Bool {
        #if DEBUG
        true
        #else
        false
        #endif
    }

    static func supportsMacOS15APIs() -> Bool {
        if #available(macOS 15, *) {
            return true
        }
        return false
    }
}
