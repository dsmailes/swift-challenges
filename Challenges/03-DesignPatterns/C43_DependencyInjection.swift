// ════════════════════════════════════════════════════════════════════════
//  Challenge 43 · Dependency Injection                         Difficulty ★★☆
//  Interview question: "How would you explain dependency injection to a
//  junior developer?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  Dependency injection means giving an object the things it needs (its
//  dependencies) from the outside, instead of having it create them itself.
//  If `GreetingService` called `Date()` directly, tests could never control
//  the time of day. By depending on a `DateProvider` protocol, production
//  code can pass the real clock while tests pass a fixed date.
//
//  YOUR TASK
//  1. Store the injected `dateProvider` and `calendar` in `GreetingService`.
//  2. `greeting(for:)` – based on the hour of `dateProvider.now` in the
//     injected calendar:
//        before 12:00 → "Good morning, <name>!"
//        before 18:00 → "Good afternoon, <name>!"
//        otherwise    → "Good evening, <name>!"
//  3. `SystemDateProvider` – the production implementation, returns `Date()`.
//     Give `GreetingService.init` default arguments so production callers can
//     just write `GreetingService()`.
// ════════════════════════════════════════════════════════════════════════

import Foundation

protocol DateProvider {
    var now: Date { get }
}

struct SystemDateProvider: DateProvider {
    var now: Date {
        // TODO
        .distantPast
    }
}

struct GreetingService {
    init(dateProvider: DateProvider, calendar: Calendar) {
        // TODO
    }

    func greeting(for name: String) -> String {
        // TODO
        ""
    }
}
