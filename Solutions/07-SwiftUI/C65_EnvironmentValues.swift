// Solution · Challenge 65 · The SwiftUI Environment

import SwiftUI

enum CardStyle: Hashable {
    case rounded
    case square
    case borderless
}

extension EnvironmentValues {
    @Entry var cardStyle: CardStyle = .rounded
    @Entry var maxItemsPerRow: Int = 3
}

// The pre-@Entry way, for reference:
//
// private struct MaxItemsPerRowKey: EnvironmentKey {
//     static let defaultValue = 3
// }
//
// extension EnvironmentValues {
//     var maxItemsPerRow: Int {
//         get { self[MaxItemsPerRowKey.self] }
//         set { self[MaxItemsPerRowKey.self] = newValue }
//     }
// }

extension View {
    func cardStyle(_ style: CardStyle) -> some View {
        environment(\.cardStyle, style)
    }
}
