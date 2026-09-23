// ════════════════════════════════════════════════════════════════════════
//  Challenge 65 · The SwiftUI Environment                      Difficulty ★★☆
//  Interview question: "How would you explain SwiftUI's environment to a
//  new developer?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  The environment is a set of values that flows DOWN the view hierarchy:
//  color scheme, locale, dynamic type size, dismiss actions… A parent sets a
//  value with `.environment(\.key, value)` and any descendant reads it with
//  `@Environment(\.key)`, without passing it through every initializer.
//  You can add your own values by extending `EnvironmentValues` – the
//  `@Entry` macro makes this a one-liner (older code writes an
//  `EnvironmentKey` type by hand).
//
//  YOUR TASK
//  The placeholder properties below ignore writes. Replace them with real
//  environment values:
//  1. `cardStyle` – a `CardStyle`, default `.rounded`.
//  2. `maxItemsPerRow` – an Int, default 3.
//  3. Finish the `cardStyle(_:)` View modifier so it sets the value in the
//     environment.
//  BONUS: build a small view that reads `@Environment(\.cardStyle)`.
// ════════════════════════════════════════════════════════════════════════

import SwiftUI

enum CardStyle: Hashable {
    case rounded
    case square
    case borderless
}

extension EnvironmentValues {
    // TODO: replace with real environment values.
    var cardStyle: CardStyle {
        get { .square }
        set { }
    }

    var maxItemsPerRow: Int {
        get { 0 }
        set { }
    }
}

extension View {
    func cardStyle(_ style: CardStyle) -> some View {
        // TODO
        self
    }
}
