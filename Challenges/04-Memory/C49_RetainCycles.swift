// ════════════════════════════════════════════════════════════════════════
//  Challenge 49 · Retain Cycles & ARC                          Difficulty ★★☆
//  Interview questions: "How would you identify and resolve a retain cycle?",
//  "How does Swift handle memory management?", and "How would you explain
//  ARC to a new iOS developer?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Automatic Reference Counting (ARC) frees a class instance when no strong
//  references to it remain. If two objects hold strong references to each
//  other, neither count can ever reach zero – a retain cycle – and both leak.
//  Break the cycle by making the "back" reference `weak` (or `unowned`).
//  Xcode's Memory Graph Debugger (and Instruments > Leaks) help find them.
//
//  YOUR TASK
//  This code leaks. Fix BOTH cycles without removing any properties:
//  1. `Tenant` ↔ `Apartment` – a tenant owns their lease on an apartment;
//     the apartment shouldn't keep its tenant alive.
//  2. `TreeNode` – parents own their children; children should not own their
//     parent.
//
//  `onDeinit` lets the tests observe deallocation.
// ════════════════════════════════════════════════════════════════════════

final class Tenant {
    let name: String
    var apartment: Apartment?
    var onDeinit: (() -> Void)?

    init(name: String) { self.name = name }
    deinit { onDeinit?() }
}

final class Apartment {
    let unit: String
    var tenant: Tenant? // TODO
    var onDeinit: (() -> Void)?

    init(unit: String) { self.unit = unit }
    deinit { onDeinit?() }
}

final class TreeNode {
    let value: String
    var children: [TreeNode] = []
    var parent: TreeNode? // TODO
    var onDeinit: (() -> Void)?

    init(value: String) { self.value = value }
    deinit { onDeinit?() }

    func add(_ child: TreeNode) {
        children.append(child)
        child.parent = self
    }
}
