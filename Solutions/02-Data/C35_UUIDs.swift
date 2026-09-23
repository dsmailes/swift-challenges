// Solution · Challenge 35 · UUIDs

import Foundation

struct TodoItem: Identifiable, Equatable {
    let id: UUID
    var title: String

    init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }

    init(title: String) {
        self.init(id: UUID(), title: title)
    }
}

func parseUUID(_ string: String) -> UUID? {
    UUID(uuidString: string)
}

func removingDuplicateIDs(_ items: [TodoItem]) -> [TodoItem] {
    var seen = Set<UUID>()
    return items.filter { seen.insert($0.id).inserted }
}

func indexByID(_ items: [TodoItem]) -> [UUID: TodoItem] {
    Dictionary(items.map { ($0.id, $0) }, uniquingKeysWith: { _, last in last })
}
