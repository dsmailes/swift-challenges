import Foundation
import Testing
@testable import Challenges

@Suite("C55 · NotificationCenter")
struct C55_NotificationCenterTests {
    final class Recorder: NSObject {
        var usernames: [String] = []

        @objc func record(_ notification: Notification) {
            usernames.append(notification.userInfo?[SessionManager.usernameKey] as? String ?? "missing")
        }
    }

    @Test func postsUsername() {
        let center = NotificationCenter()
        let recorder = Recorder()
        center.addObserver(recorder, selector: #selector(Recorder.record(_:)), name: .userDidLogIn, object: nil)

        SessionManager(center: center).logIn(username: "ada")
        #expect(recorder.usernames == ["ada"])
    }

    @Test func bannersReceiveBroadcasts() {
        let center = NotificationCenter()
        let first = LoginBanner(center: center)
        let second = LoginBanner(center: center)
        let session = SessionManager(center: center)

        session.logIn(username: "ada")
        session.logIn(username: "grace")

        #expect(first.messages == ["Welcome, ada!", "Welcome, grace!"])
        #expect(second.messages == first.messages)
    }

    @Test func stopListening() {
        let center = NotificationCenter()
        let banner = LoginBanner(center: center)
        let session = SessionManager(center: center)
        session.logIn(username: "ada")
        banner.stopListening()
        session.logIn(username: "grace")
        #expect(banner.messages == ["Welcome, ada!"])
    }
}
