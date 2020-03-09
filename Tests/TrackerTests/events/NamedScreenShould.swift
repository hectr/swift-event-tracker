@testable import Tracker
import XCTest

final class NamedScreenShould: XCTestCase {
    func testInitializeFromStringLiteral() {
        let screen: NamedScreen = "some event name"
        XCTAssertEqual(screen.name, "some event name")
        XCTAssertEqual(screen.excludedTags, [])
        XCTAssertEqual(screen.requiredTags, [])
    }

    func testSupportAddingRequiredTag() {
        let screen: Screen = "some event name" + Tag.debugging
        XCTAssertEqual(screen.name, "some event name")
        XCTAssertEqual(screen.excludedTags, [])
        XCTAssertEqual(screen.requiredTags, [.debugging])
    }

    func testSupportAddingRequiredTags() {
        let screen = NamedScreen("some event name") + [.analytics, .debugging]
        XCTAssertEqual(screen.name, "some event name")
        XCTAssertEqual(screen.excludedTags, [])
        XCTAssertEqual(screen.requiredTags, [.analytics, .debugging])
    }

    func testSupportAddingExcludedTag() {
        let screen: Screen = "some event name" - Tag.crashReporting
        XCTAssertEqual(screen.name, "some event name")
        XCTAssertEqual(screen.excludedTags, [.crashReporting])
        XCTAssertEqual(screen.requiredTags, [])
    }

    func testSupportAddingExcludedTags() {
        let screen = NamedScreen("some event name") - [.debugging, .crashReporting]
        XCTAssertEqual(screen.name, "some event name")
        XCTAssertEqual(screen.excludedTags, [.debugging, .crashReporting])
        XCTAssertEqual(screen.requiredTags, [])
    }}
