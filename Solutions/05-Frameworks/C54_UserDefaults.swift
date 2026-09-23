// Solution · Challenge 54 · UserDefaults

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
        get { defaults.string(forKey: Keys.username) }
        set {
            if let newValue {
                defaults.set(newValue, forKey: Keys.username)
            } else {
                defaults.removeObject(forKey: Keys.username)
            }
        }
    }

    var launchCount: Int {
        defaults.integer(forKey: Keys.launchCount) // 0 when missing
    }

    func incrementLaunchCount() {
        defaults.set(launchCount + 1, forKey: Keys.launchCount)
    }

    var favoriteColors: [String] {
        get { defaults.stringArray(forKey: Keys.favoriteColors) ?? [] }
        set { defaults.set(newValue, forKey: Keys.favoriteColors) }
    }

    func reset() {
        for key in [Keys.username, Keys.launchCount, Keys.favoriteColors] {
            defaults.removeObject(forKey: key)
        }
    }
}
