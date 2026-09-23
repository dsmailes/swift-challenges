import SwiftUI
import Testing
@testable import Challenges

@Suite("C65 · The SwiftUI Environment")
struct C65_EnvironmentValuesTests {
    @Test func defaults() {
        let environment = EnvironmentValues()
        #expect(environment.cardStyle == .rounded)
        #expect(environment.maxItemsPerRow == 3)
    }

    @Test func overriding() {
        var environment = EnvironmentValues()
        environment.cardStyle = .borderless
        environment.maxItemsPerRow = 5
        #expect(environment.cardStyle == .borderless)
        #expect(environment.maxItemsPerRow == 5)
    }
}
