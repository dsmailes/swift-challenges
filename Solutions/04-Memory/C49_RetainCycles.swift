// Solution · Challenge 49 · Retain Cycles & ARC

final class Tenant {
    let name: String
    var apartment: Apartment?
    var onDeinit: (() -> Void)?

    init(name: String) { self.name = name }
    deinit { onDeinit?() }
}

final class Apartment {
    let unit: String
    weak var tenant: Tenant?
    var onDeinit: (() -> Void)?

    init(unit: String) { self.unit = unit }
    deinit { onDeinit?() }
}

final class TreeNode {
    let value: String
    var children: [TreeNode] = []
    weak var parent: TreeNode?
    var onDeinit: (() -> Void)?

    init(value: String) { self.value = value }
    deinit { onDeinit?() }

    func add(_ child: TreeNode) {
        children.append(child)
        child.parent = self
    }
}
