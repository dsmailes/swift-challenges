// Solution · Challenge 55 · NotificationCenter

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
        center.post(name: .userDidLogIn, object: self, userInfo: [Self.usernameKey: username])
    }
}

final class LoginBanner: NSObject {
    private let center: NotificationCenter
    private(set) var messages: [String] = []

    init(center: NotificationCenter = .default) {
        self.center = center
        super.init()
        center.addObserver(self, selector: #selector(userDidLogIn(_:)), name: .userDidLogIn, object: nil)
    }

    @objc private func userDidLogIn(_ notification: Notification) {
        guard let username = notification.userInfo?[SessionManager.usernameKey] as? String else { return }
        messages.append("Welcome, \(username)!")
    }

    func stopListening() {
        center.removeObserver(self, name: .userDidLogIn, object: nil)
    }
}
