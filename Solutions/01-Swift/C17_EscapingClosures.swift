// Solution · Challenge 17 · Escaping vs Non-Escaping Closures

final class TaskQueue {
    private var tasks: [() -> Void] = []

    func enqueue(_ task: @escaping () -> Void) {
        tasks.append(task)
    }

    var pendingCount: Int {
        tasks.count
    }

    func runAll() {
        let current = tasks
        tasks.removeAll()
        for task in current {
            task()
        }
    }
}

func measure(_ work: () -> Int) -> (result: Int, calls: Int) {
    (work(), 1)
}
