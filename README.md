# Swift Challenges

76 hands-on Swift coding challenges, each with instructions, a starter file,
a test suite, and a reference solution.

Most challenges are based on the coding-related questions in
[Hacking with Swift's interview questions list](https://www.hackingwithswift.com/interview-questions).
Each one is marked with the interview questions it covers. The **Concurrency**
section (C66–C76) goes beyond that list: it covers async/await, task groups,
actors, **actor reentrancy**, Sendable, global actors, continuations,
AsyncStream, cancellation, and unstructured tasks.

> The questions come from Hacking with Swift. The challenge text, code, tests,
> and solutions in this repo are original.

## Requirements

- Xcode 16 or later (Swift 6 language mode, Swift Testing)
- macOS 15 or later (the tests run natively on your Mac, no simulator needed)
- [XcodeGen](https://github.com/yonaskolb/XcodeGen), only if you add files or
  change `project.yml`

## How it works

```
Challenges/   ← your work: one file per challenge, instructions in the header
Tests/        ← the Swift Testing suite for each challenge
Solutions/    ← reference answers (not compiled, so no peeking by accident)
Scripts/      ← verify-solutions.sh
project.yml   ← XcodeGen spec that generates SwiftChallenges.xcodeproj
```

1. Open `SwiftChallenges.xcodeproj`.
2. Pick a challenge in `Challenges/` and read the header comment: it gives
   the background, the interview question(s), and your task.
3. Replace the `// TODO` stubs with your own code.
4. Run that challenge's tests: click the diamond next to its suite in the
   matching `…Tests.swift` file, or filter the Test navigator (⌘6) by its
   number, e.g. `C42`. ⌘U runs everything.
5. Stuck? Compare with the matching file in `Solutions/`.

Every stub compiles and every test starts out failing. Stubs return
placeholder values rather than crashing, so one unfinished challenge never
takes down the whole test run.

Some challenges are "find the bug" exercises: the starter code works but has
a flaw, such as a retain cycle, a data race, or an actor reentrancy bug.
Those are marked in the instructions.

### Starting over

Put the project under git before you start, then restore any challenge with:

```bash
git checkout -- Challenges/01-Swift/C01_NilCoalescing.swift
```

### Checking the reference solutions

`Scripts/verify-solutions.sh` copies the project to a temporary folder,
swaps every challenge for its solution, and runs the full suite. It's useful
when you edit a test or a solution:

```bash
Scripts/verify-solutions.sh
```

### Adding a challenge

1. Add `Challenges/<category>/CNN_Name.swift`, `Tests/<category>/CNN_NameTests.swift`,
   and `Solutions/<category>/CNN_Name.swift`. Type names must be unique
   across the whole module.
2. Run `xcodegen generate` to update the Xcode project.
3. Run `Scripts/verify-solutions.sh`.

## Challenges

Difficulty: ★☆☆ warm-up · ★★☆ interview standard · ★★★ stretch

### Swift Language

| # | Challenge | Difficulty | Files |
|---|---|---|---|
| 01 | Nil Coalescing | ★☆☆ | [challenge](Challenges/01-Swift/C01_NilCoalescing.swift) · [tests](Tests/01-Swift/C01_NilCoalescingTests.swift) · [solution](Solutions/01-Swift/C01_NilCoalescing.swift) |
| 02 | Optional Chaining | ★☆☆ | [challenge](Challenges/01-Swift/C02_OptionalChaining.swift) · [tests](Tests/01-Swift/C02_OptionalChainingTests.swift) · [solution](Solutions/01-Swift/C02_OptionalChaining.swift) |
| 03 | if let vs guard let | ★☆☆ | [challenge](Challenges/01-Swift/C03_IfLetGuardLet.swift) · [tests](Tests/01-Swift/C03_IfLetGuardLetTests.swift) · [solution](Solutions/01-Swift/C03_IfLetGuardLet.swift) |
| 04 | try, try?, and try! | ★☆☆ | [challenge](Challenges/01-Swift/C04_TryVariants.swift) · [tests](Tests/01-Swift/C04_TryVariantsTests.swift) · [solution](Solutions/01-Swift/C04_TryVariants.swift) |
| 05 | Property Observers | ★☆☆ | [challenge](Challenges/01-Swift/C05_PropertyObservers.swift) · [tests](Tests/01-Swift/C05_PropertyObserversTests.swift) · [solution](Solutions/01-Swift/C05_PropertyObservers.swift) |
| 06 | Raw Strings | ★☆☆ | [challenge](Challenges/01-Swift/C06_RawStrings.swift) · [tests](Tests/01-Swift/C06_RawStringsTests.swift) · [solution](Solutions/01-Swift/C06_RawStrings.swift) |
| 07 | CaseIterable | ★☆☆ | [challenge](Challenges/01-Swift/C07_CaseIterable.swift) · [tests](Tests/01-Swift/C07_CaseIterableTests.swift) · [solution](Solutions/01-Swift/C07_CaseIterable.swift) |
| 08 | Enum Associated Values | ★★☆ | [challenge](Challenges/01-Swift/C08_EnumAssociatedValues.swift) · [tests](Tests/01-Swift/C08_EnumAssociatedValuesTests.swift) · [solution](Solutions/01-Swift/C08_EnumAssociatedValues.swift) |
| 09 | Closures | ★★☆ | [challenge](Challenges/01-Swift/C09_Closures.swift) · [tests](Tests/01-Swift/C09_ClosuresTests.swift) · [solution](Solutions/01-Swift/C09_Closures.swift) |
| 10 | Variadic Functions | ★☆☆ | [challenge](Challenges/01-Swift/C10_VariadicFunctions.swift) · [tests](Tests/01-Swift/C10_VariadicFunctionsTests.swift) · [solution](Solutions/01-Swift/C10_VariadicFunctions.swift) |
| 11 | Generics | ★★☆ | [challenge](Challenges/01-Swift/C11_Generics.swift) · [tests](Tests/01-Swift/C11_GenericsTests.swift) · [solution](Solutions/01-Swift/C11_Generics.swift) |
| 12 | Protocols | ★☆☆ | [challenge](Challenges/01-Swift/C12_Protocols.swift) · [tests](Tests/01-Swift/C12_ProtocolsTests.swift) · [solution](Solutions/01-Swift/C12_Protocols.swift) |
| 13 | Extensions vs Protocol Extensions | ★★☆ | [challenge](Challenges/01-Swift/C13_ProtocolExtensions.swift) · [tests](Tests/01-Swift/C13_ProtocolExtensionsTests.swift) · [solution](Solutions/01-Swift/C13_ProtocolExtensions.swift) |
| 14 | Operator Overloading | ★★☆ | [challenge](Challenges/01-Swift/C14_OperatorOverloading.swift) · [tests](Tests/01-Swift/C14_OperatorOverloadingTests.swift) · [solution](Solutions/01-Swift/C14_OperatorOverloading.swift) |
| 15 | Multi-Pattern Catch Clauses | ★★☆ | [challenge](Challenges/01-Swift/C15_MultiPatternCatch.swift) · [tests](Tests/01-Swift/C15_MultiPatternCatchTests.swift) · [solution](Solutions/01-Swift/C15_MultiPatternCatch.swift) |
| 16 | defer | ★★☆ | [challenge](Challenges/01-Swift/C16_Defer.swift) · [tests](Tests/01-Swift/C16_DeferTests.swift) · [solution](Solutions/01-Swift/C16_Defer.swift) |
| 17 | Escaping vs Non-Escaping Closures | ★★☆ | [challenge](Challenges/01-Swift/C17_EscapingClosures.swift) · [tests](Tests/01-Swift/C17_EscapingClosuresTests.swift) · [solution](Solutions/01-Swift/C17_EscapingClosures.swift) |
| 18 | @autoclosure | ★★☆ | [challenge](Challenges/01-Swift/C18_Autoclosure.swift) · [tests](Tests/01-Swift/C18_AutoclosureTests.swift) · [solution](Solutions/01-Swift/C18_Autoclosure.swift) |
| 19 | Key Paths | ★★☆ | [challenge](Challenges/01-Swift/C19_KeyPaths.swift) · [tests](Tests/01-Swift/C19_KeyPathsTests.swift) · [solution](Solutions/01-Swift/C19_KeyPaths.swift) |
| 20 | Property Wrappers | ★★★ | [challenge](Challenges/01-Swift/C20_PropertyWrappers.swift) · [tests](Tests/01-Swift/C20_PropertyWrappersTests.swift) · [solution](Solutions/01-Swift/C20_PropertyWrappers.swift) |
| 21 | Conditional Conformances | ★★★ | [challenge](Challenges/01-Swift/C21_ConditionalConformance.swift) · [tests](Tests/01-Swift/C21_ConditionalConformanceTests.swift) · [solution](Solutions/01-Swift/C21_ConditionalConformance.swift) |
| 22 | Opaque Return Types | ★★☆ | [challenge](Challenges/01-Swift/C22_OpaqueReturnTypes.swift) · [tests](Tests/01-Swift/C22_OpaqueReturnTypesTests.swift) · [solution](Solutions/01-Swift/C22_OpaqueReturnTypes.swift) |
| 23 | Result Builders | ★★★ | [challenge](Challenges/01-Swift/C23_ResultBuilders.swift) · [tests](Tests/01-Swift/C23_ResultBuildersTests.swift) · [solution](Solutions/01-Swift/C23_ResultBuilders.swift) |
| 24 | self vs Self | ★★☆ | [challenge](Challenges/01-Swift/C24_SelfVsSelf.swift) · [tests](Tests/01-Swift/C24_SelfVsSelfTests.swift) · [solution](Solutions/01-Swift/C24_SelfVsSelf.swift) |
| 25 | Compiler Directives & Availability | ★☆☆ | [challenge](Challenges/01-Swift/C25_CompilerDirectives.swift) · [tests](Tests/01-Swift/C25_CompilerDirectivesTests.swift) · [solution](Solutions/01-Swift/C25_CompilerDirectives.swift) |

### Data & Collections

| # | Challenge | Difficulty | Files |
|---|---|---|---|
| 26 | Arrays vs Dictionaries | ★☆☆ | [challenge](Challenges/02-Data/C26_ArraysAndDictionaries.swift) · [tests](Tests/02-Data/C26_ArraysAndDictionariesTests.swift) · [solution](Solutions/02-Data/C26_ArraysAndDictionaries.swift) |
| 27 | Arrays vs Sets | ★☆☆ | [challenge](Challenges/02-Data/C27_ArraysAndSets.swift) · [tests](Tests/02-Data/C27_ArraysAndSetsTests.swift) · [solution](Solutions/02-Data/C27_ArraysAndSets.swift) |
| 28 | Tuples | ★☆☆ | [challenge](Challenges/02-Data/C28_Tuples.swift) · [tests](Tests/02-Data/C28_TuplesTests.swift) · [solution](Solutions/02-Data/C28_Tuples.swift) |
| 29 | map, compactMap, and flatMap | ★☆☆ | [challenge](Challenges/02-Data/C29_MapCompactMap.swift) · [tests](Tests/02-Data/C29_MapCompactMapTests.swift) · [solution](Solutions/02-Data/C29_MapCompactMap.swift) |
| 30 | One-Sided Ranges | ★☆☆ | [challenge](Challenges/02-Data/C30_OneSidedRanges.swift) · [tests](Tests/02-Data/C30_OneSidedRangesTests.swift) · [solution](Solutions/02-Data/C30_OneSidedRanges.swift) |
| 31 | Strings Are Collections | ★★☆ | [challenge](Challenges/02-Data/C31_StringsAsCollections.swift) · [tests](Tests/02-Data/C31_StringsAsCollectionsTests.swift) · [solution](Solutions/02-Data/C31_StringsAsCollections.swift) |
| 32 | Float, Double, and CGFloat | ★★☆ | [challenge](Challenges/02-Data/C32_FloatingPoint.swift) · [tests](Tests/02-Data/C32_FloatingPointTests.swift) · [solution](Solutions/02-Data/C32_FloatingPoint.swift) |
| 33 | Codable | ★★☆ | [challenge](Challenges/02-Data/C33_Codable.swift) · [tests](Tests/02-Data/C33_CodableTests.swift) · [solution](Solutions/02-Data/C33_Codable.swift) |
| 34 | Key & Date Decoding Strategies | ★★☆ | [challenge](Challenges/02-Data/C34_KeyDecodingStrategies.swift) · [tests](Tests/02-Data/C34_KeyDecodingStrategiesTests.swift) · [solution](Solutions/02-Data/C34_KeyDecodingStrategies.swift) |
| 35 | UUIDs | ★☆☆ | [challenge](Challenges/02-Data/C35_UUIDs.swift) · [tests](Tests/02-Data/C35_UUIDsTests.swift) · [solution](Solutions/02-Data/C35_UUIDs.swift) |
| 36 | The Result Type | ★★☆ | [challenge](Challenges/02-Data/C36_ResultType.swift) · [tests](Tests/02-Data/C36_ResultTypeTests.swift) · [solution](Solutions/02-Data/C36_ResultType.swift) |
| 37 | Classes vs Structs | ★★☆ | [challenge](Challenges/02-Data/C37_ClassesAndStructs.swift) · [tests](Tests/02-Data/C37_ClassesAndStructsTests.swift) · [solution](Solutions/02-Data/C37_ClassesAndStructs.swift) |
| 38 | Value vs Reference Types (Copy-on-Write) | ★★★ | [challenge](Challenges/02-Data/C38_CopyOnWrite.swift) · [tests](Tests/02-Data/C38_CopyOnWriteTests.swift) · [solution](Solutions/02-Data/C38_CopyOnWrite.swift) |
| 39 | Immutability | ★★☆ | [challenge](Challenges/02-Data/C39_Immutability.swift) · [tests](Tests/02-Data/C39_ImmutabilityTests.swift) · [solution](Solutions/02-Data/C39_Immutability.swift) |
| 40 | Type Erasure | ★★★ | [challenge](Challenges/02-Data/C40_TypeErasure.swift) · [tests](Tests/02-Data/C40_TypeErasureTests.swift) · [solution](Solutions/02-Data/C40_TypeErasure.swift) |

### Design Patterns

| # | Challenge | Difficulty | Files |
|---|---|---|---|
| 41 | Delegation | ★★☆ | [challenge](Challenges/03-DesignPatterns/C41_Delegates.swift) · [tests](Tests/03-DesignPatterns/C41_DelegatesTests.swift) · [solution](Solutions/03-DesignPatterns/C41_Delegates.swift) |
| 42 | MVVM | ★★☆ | [challenge](Challenges/03-DesignPatterns/C42_MVVM.swift) · [tests](Tests/03-DesignPatterns/C42_MVVMTests.swift) · [solution](Solutions/03-DesignPatterns/C42_MVVM.swift) |
| 43 | Dependency Injection | ★★☆ | [challenge](Challenges/03-DesignPatterns/C43_DependencyInjection.swift) · [tests](Tests/03-DesignPatterns/C43_DependencyInjectionTests.swift) · [solution](Solutions/03-DesignPatterns/C43_DependencyInjection.swift) |
| 44 | Protocol-Oriented Programming | ★★★ | [challenge](Challenges/03-DesignPatterns/C44_ProtocolOrientedProgramming.swift) · [tests](Tests/03-DesignPatterns/C44_ProtocolOrientedProgrammingTests.swift) · [solution](Solutions/03-DesignPatterns/C44_ProtocolOrientedProgramming.swift) |
| 45 | Functional Programming | ★★☆ | [challenge](Challenges/03-DesignPatterns/C45_FunctionalProgramming.swift) · [tests](Tests/03-DesignPatterns/C45_FunctionalProgrammingTests.swift) · [solution](Solutions/03-DesignPatterns/C45_FunctionalProgramming.swift) |
| 46 | Key-Value Observing (KVO) | ★★☆ | [challenge](Challenges/03-DesignPatterns/C46_KVO.swift) · [tests](Tests/03-DesignPatterns/C46_KVOTests.swift) · [solution](Solutions/03-DesignPatterns/C46_KVO.swift) |
| 47 | Singletons | ★☆☆ | [challenge](Challenges/03-DesignPatterns/C47_Singletons.swift) · [tests](Tests/03-DesignPatterns/C47_SingletonsTests.swift) · [solution](Solutions/03-DesignPatterns/C47_Singletons.swift) |
| 48 | Phantom Types | ★★★ | [challenge](Challenges/03-DesignPatterns/C48_PhantomTypes.swift) · [tests](Tests/03-DesignPatterns/C48_PhantomTypesTests.swift) · [solution](Solutions/03-DesignPatterns/C48_PhantomTypes.swift) |

### Memory & Performance

| # | Challenge | Difficulty | Files |
|---|---|---|---|
| 49 | Retain Cycles & ARC | ★★☆ | [challenge](Challenges/04-Memory/C49_RetainCycles.swift) · [tests](Tests/04-Memory/C49_RetainCyclesTests.swift) · [solution](Solutions/04-Memory/C49_RetainCycles.swift) |
| 50 | weak vs unowned | ★★☆ | [challenge](Challenges/04-Memory/C50_WeakVsUnowned.swift) · [tests](Tests/04-Memory/C50_WeakVsUnownedTests.swift) · [solution](Solutions/04-Memory/C50_WeakVsUnowned.swift) |
| 51 | Memory Leaks from Closures | ★★☆ | [challenge](Challenges/04-Memory/C51_ClosureCaptureLeaks.swift) · [tests](Tests/04-Memory/C51_ClosureCaptureLeaksTests.swift) · [solution](Solutions/04-Memory/C51_ClosureCaptureLeaks.swift) |
| 52 | In-Memory Caching (LRU) | ★★★ | [challenge](Challenges/04-Memory/C52_LRUCache.swift) · [tests](Tests/04-Memory/C52_LRUCacheTests.swift) · [solution](Solutions/04-Memory/C52_LRUCache.swift) |

### Apple Frameworks

| # | Challenge | Difficulty | Files |
|---|---|---|---|
| 53 | Listing Files with FileManager | ★★☆ | [challenge](Challenges/05-Frameworks/C53_FileManager.swift) · [tests](Tests/05-Frameworks/C53_FileManagerTests.swift) · [solution](Solutions/05-Frameworks/C53_FileManager.swift) |
| 54 | UserDefaults | ★☆☆ | [challenge](Challenges/05-Frameworks/C54_UserDefaults.swift) · [tests](Tests/05-Frameworks/C54_UserDefaultsTests.swift) · [solution](Solutions/05-Frameworks/C54_UserDefaults.swift) |
| 55 | NotificationCenter | ★★☆ | [challenge](Challenges/05-Frameworks/C55_NotificationCenter.swift) · [tests](Tests/05-Frameworks/C55_NotificationCenterTests.swift) · [solution](Solutions/05-Frameworks/C55_NotificationCenter.swift) |
| 56 | Making a Network Request | ★★★ | [challenge](Challenges/05-Frameworks/C56_NetworkRequests.swift) · [tests](Tests/05-Frameworks/C56_NetworkRequestsTests.swift) · [solution](Solutions/05-Frameworks/C56_NetworkRequests.swift) |
| 57 | Grand Central Dispatch | ★★★ | [challenge](Challenges/05-Frameworks/C57_GCD.swift) · [tests](Tests/05-Frameworks/C57_GCDTests.swift) · [solution](Solutions/05-Frameworks/C57_GCD.swift) |
| 58 | Sort Descriptors | ★★☆ | [challenge](Challenges/05-Frameworks/C58_SortDescriptors.swift) · [tests](Tests/05-Frameworks/C58_SortDescriptorsTests.swift) · [solution](Solutions/05-Frameworks/C58_SortDescriptors.swift) |
| 59 | CGAffineTransform | ★★☆ | [challenge](Challenges/05-Frameworks/C59_AffineTransforms.swift) · [tests](Tests/05-Frameworks/C59_AffineTransformsTests.swift) · [solution](Solutions/05-Frameworks/C59_AffineTransforms.swift) |
| 60 | Attributed Strings | ★★☆ | [challenge](Challenges/05-Frameworks/C60_AttributedStrings.swift) · [tests](Tests/05-Frameworks/C60_AttributedStringsTests.swift) · [solution](Solutions/05-Frameworks/C60_AttributedStrings.swift) |
| 61 | Color Values Outside 0…1 | ★★☆ | [challenge](Challenges/05-Frameworks/C61_ColorComponents.swift) · [tests](Tests/05-Frameworks/C61_ColorComponentsTests.swift) · [solution](Solutions/05-Frameworks/C61_ColorComponents.swift) |

### Security

| # | Challenge | Difficulty | Files |
|---|---|---|---|
| 62 | Secure Hashing with CryptoKit | ★★☆ | [challenge](Challenges/06-Security/C62_SecureHashing.swift) · [tests](Tests/06-Security/C62_SecureHashingTests.swift) · [solution](Solutions/06-Security/C62_SecureHashing.swift) |

### SwiftUI

| # | Challenge | Difficulty | Files |
|---|---|---|---|
| 63 | Announcing Changes to SwiftUI | ★★☆ | [challenge](Challenges/07-SwiftUI/C63_ObservableObjects.swift) · [tests](Tests/07-SwiftUI/C63_ObservableObjectsTests.swift) · [solution](Solutions/07-SwiftUI/C63_ObservableObjects.swift) |
| 64 | Programmatic Navigation | ★★☆ | [challenge](Challenges/07-SwiftUI/C64_ProgrammaticNavigation.swift) · [tests](Tests/07-SwiftUI/C64_ProgrammaticNavigationTests.swift) · [solution](Solutions/07-SwiftUI/C64_ProgrammaticNavigation.swift) |
| 65 | The SwiftUI Environment | ★★☆ | [challenge](Challenges/07-SwiftUI/C65_EnvironmentValues.swift) · [tests](Tests/07-SwiftUI/C65_EnvironmentValuesTests.swift) · [solution](Solutions/07-SwiftUI/C65_EnvironmentValues.swift) |

### Concurrency (async/await, actors & more)

| # | Challenge | Difficulty | Files |
|---|---|---|---|
| 66 | async/await and async let | ★★☆ | [challenge](Challenges/08-Concurrency/C66_AsyncAwait.swift) · [tests](Tests/08-Concurrency/C66_AsyncAwaitTests.swift) · [solution](Solutions/08-Concurrency/C66_AsyncAwait.swift) |
| 67 | Task Groups | ★★★ | [challenge](Challenges/08-Concurrency/C67_TaskGroups.swift) · [tests](Tests/08-Concurrency/C67_TaskGroupsTests.swift) · [solution](Solutions/08-Concurrency/C67_TaskGroups.swift) |
| 68 | Actors | ★★☆ | [challenge](Challenges/08-Concurrency/C68_Actors.swift) · [tests](Tests/08-Concurrency/C68_ActorsTests.swift) · [solution](Solutions/08-Concurrency/C68_Actors.swift) |
| 69 | Actor Reentrancy: Stale State | ★★★ | [challenge](Challenges/08-Concurrency/C69_ActorReentrancy.swift) · [tests](Tests/08-Concurrency/C69_ActorReentrancyTests.swift) · [solution](Solutions/08-Concurrency/C69_ActorReentrancy.swift) |
| 70 | Actor Reentrancy: Duplicate Work | ★★★ | [challenge](Challenges/08-Concurrency/C70_ActorReentrancyDeduplication.swift) · [tests](Tests/08-Concurrency/C70_ActorReentrancyDeduplicationTests.swift) · [solution](Solutions/08-Concurrency/C70_ActorReentrancyDeduplication.swift) |
| 71 | Sendable & Data-Race Safety | ★★★ | [challenge](Challenges/08-Concurrency/C71_Sendable.swift) · [tests](Tests/08-Concurrency/C71_SendableTests.swift) · [solution](Solutions/08-Concurrency/C71_Sendable.swift) |
| 72 | MainActor & Global Actors | ★★★ | [challenge](Challenges/08-Concurrency/C72_MainActorAndGlobalActors.swift) · [tests](Tests/08-Concurrency/C72_MainActorAndGlobalActorsTests.swift) · [solution](Solutions/08-Concurrency/C72_MainActorAndGlobalActors.swift) |
| 73 | Continuations: Bridging Callback APIs | ★★☆ | [challenge](Challenges/08-Concurrency/C73_Continuations.swift) · [tests](Tests/08-Concurrency/C73_ContinuationsTests.swift) · [solution](Solutions/08-Concurrency/C73_Continuations.swift) |
| 74 | AsyncSequence & AsyncStream | ★★★ | [challenge](Challenges/08-Concurrency/C74_AsyncStream.swift) · [tests](Tests/08-Concurrency/C74_AsyncStreamTests.swift) · [solution](Solutions/08-Concurrency/C74_AsyncStream.swift) |
| 75 | Cancellation & Timeouts | ★★★ | [challenge](Challenges/08-Concurrency/C75_Cancellation.swift) · [tests](Tests/08-Concurrency/C75_CancellationTests.swift) · [solution](Solutions/08-Concurrency/C75_Cancellation.swift) |
| 76 | Unstructured Tasks: A Debouncer | ★★★ | [challenge](Challenges/08-Concurrency/C76_UnstructuredTasks.swift) · [tests](Tests/08-Concurrency/C76_UnstructuredTasksTests.swift) · [solution](Solutions/08-Concurrency/C76_UnstructuredTasks.swift) |

## Questions not included

Many of the listed questions are about experience or opinion ("What books
would you recommend?", "Have you ever filed bugs with Apple?"), or cover UI
work that unit tests can't check well (storyboards, segues, shadows, size
classes). These aren't included as coding challenges, but they're still worth
preparing answers for.
