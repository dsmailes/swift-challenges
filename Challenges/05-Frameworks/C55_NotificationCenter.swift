// ════════════════════════════════════════════════════════════════════════
//  Challenge 55 · NotificationCenter                           Difficulty ★★☆
//  Interview question: "What is the purpose of `NotificationCenter`?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  NotificationCenter broadcasts messages from one part of an app to any
//  number of listeners, without them knowing about each other (one-to-many,
//  loosely coupled). Compare with delegates, which are one-to-one. Posting is
//  synchronous: observers run before `post` returns.
//
//  YOUR TASK
//  Both classes take a `NotificationCenter` so tests can use a private one.
//  1. `SessionManager.logIn(username:)` – post `.userDidLogIn`, with the
//     username in `userInfo` under `SessionManager.usernameKey`.
//  2. `LoginBanner`
//       • in `init`, start observing `.userDidLogIn` on the given center
//         using the selector-based API (the class is an NSObject)
//       • on each notification append "Welcome, <username>!" to `messages`
//       • `stopListening()` – remove the observer
// ════════════════════════════════════════════════════════════════════════

import Foundation

extension Notification.Name {
    static let userDidLogIn = Notification.Name("SwiftChallenges.userDidLogIn")
}

final class SessionManager {
    static let usernameKey = "username"
    private let center: NotificationCenter

    init(center: NotificationCenter = .default) {
        self.center = center
    }

    func logIn(username: String) {
        // TODO
    }
}

final class LoginBanner: NSObject {
    private let center: NotificationCenter
    private(set) var messages: [String] = []

    init(center: NotificationCenter = .default) {
        self.center = center
        super.init()
        // TODO: start observing
    }

    // TODO: add an @objc handler method

    func stopListening() {
        // TODO
    }
}
