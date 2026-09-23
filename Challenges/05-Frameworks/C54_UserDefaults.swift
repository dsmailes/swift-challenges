// ════════════════════════════════════════════════════════════════════════
//  Challenge 54 · UserDefaults                                 Difficulty ★☆☆
//  Interview question: "What is `UserDefaults` good for? What is
//  `UserDefaults` not good for?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  UserDefaults is good for small user preferences and flags: a theme choice,
//  "has seen onboarding", a launch count. It's NOT good for large data (it's
//  loaded into memory at launch), sensitive data like passwords or tokens
//  (use the Keychain), or structured app data (use files, SwiftData / Core
//  Data, or a database).
//
//  YOUR TASK
//  `PreferencesStore` wraps an injected `UserDefaults` instance (so tests can
//  use a throwaway suite). Using the keys in `Keys`, implement:
//  • `username` – get/set an optional String; setting nil removes the key.
//  • `launchCount` – get (0 if never set) and `incrementLaunchCount()`.
//  • `favoriteColors` – get/set a [String] ([] if never set).
//  • `reset()` – remove every key this store owns.
// ════════════════════════════════════════════════════════════════════════

import Foundation

final class PreferencesStore {
    enum Keys {
        static let username = "username"
        static let launchCount = "launchCount"
        static let favoriteColors = "favoriteColors"
    }

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    var username: String? {
        get { nil } // TODO
        set { } // TODO
    }

    var launchCount: Int {
        // TODO
        0
    }

    func incrementLaunchCount() {
        // TODO
    }

    var favoriteColors: [String] {
        get { [] } // TODO
        set { } // TODO
    }

    func reset() {
        // TODO
    }
}
