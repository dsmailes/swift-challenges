// ════════════════════════════════════════════════════════════════════════
//  Challenge 35 · UUIDs                                        Difficulty ★☆☆
//  Interview question: "What is a `UUID`, and when might you use it?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A UUID is a 128-bit universally unique identifier, e.g.
//  "E621E1F8-C36C-495A-93FC-0C247A3E6E5F". `UUID()` generates a random one
//  that's practically guaranteed never to collide, which makes it ideal for
//  identifying values (e.g. `Identifiable` for SwiftUI lists) without a
//  central authority handing out IDs.
//
//  YOUR TASK
//  1. Fix `TodoItem.init(title:)` so each new item gets a unique ID.
//  2. `parseUUID(_:)` – convert a string to a UUID, or nil if it's invalid.
//  3. `removingDuplicateIDs(_:)` – keep only the first item for each ID,
//     preserving order.
//  4. `indexByID(_:)` – build a `[UUID: TodoItem]` lookup dictionary. If two
//     items share an ID, keep the last one.
// ════════════════════════════════════════════════════════════════════════

import Foundation

struct TodoItem: Identifiable, Equatable {
    let id: UUID
    var title: String

    init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }

    init(title: String) {
        // TODO: every item should get its own identifier
        self.id = UUID(uuid: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))
        self.title = title
    }
}

func parseUUID(_ string: String) -> UUID? {
    // TODO
    nil
}

func removingDuplicateIDs(_ items: [TodoItem]) -> [TodoItem] {
    // TODO
    []
}

func indexByID(_ items: [TodoItem]) -> [UUID: TodoItem] {
    // TODO
    [:]
}
