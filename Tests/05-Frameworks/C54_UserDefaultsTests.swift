import Foundation
import Testing
@testable import Challenges

@Suite("C54 · UserDefaults")
struct C54_UserDefaultsTests {
    let suiteName = "SwiftChallenges.C54.\(UUID().uuidString)"
    let defaults: UserDefaults

    init() {
        defaults = UserDefaults(suiteName: suiteName)!
    }

    @Test func freshStoreHasDefaults() {
        let store = PreferencesStore(defaults: defaults)
        #expect(store.username == nil)
        #expect(store.launchCount == 0)
        #expect(store.favoriteColors == [])
    }

    @Test func persistsAcrossInstances() {
        let store = PreferencesStore(defaults: defaults)
        store.username = "taylor"
        store.incrementLaunchCount()
        store.incrementLaunchCount()
        store.favoriteColors = ["red", "blue"]

        let reloaded = PreferencesStore(defaults: defaults)
        #expect(reloaded.username == "taylor")
        #expect(reloaded.launchCount == 2)
        #expect(reloaded.favoriteColors == ["red", "blue"])
        defaults.removePersistentDomain(forName: suiteName)
    }

    @Test func settingNilRemovesKey() {
        let store = PreferencesStore(defaults: defaults)
        store.username = "taylor"
        store.username = nil
        #expect(defaults.object(forKey: PreferencesStore.Keys.username) == nil)
    }

    @Test func resetRemovesEverything() {
        let store = PreferencesStore(defaults: defaults)
        store.username = "taylor"
        store.incrementLaunchCount()
        store.favoriteColors = ["green"]
        store.reset()
        #expect(defaults.object(forKey: PreferencesStore.Keys.username) == nil)
        #expect(defaults.object(forKey: PreferencesStore.Keys.launchCount) == nil)
        #expect(defaults.object(forKey: PreferencesStore.Keys.favoriteColors) == nil)
    }
}
