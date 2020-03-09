@testable import Tracker
import XCTest

final class NamedEventShould: XCTestCase {
    func testInitializeFromStringLiteral() {
        let event: NamedEvent = "some event name"
        XCTAssertEqual(event.name, "some event name")
        XCTAssertEqual(event.parameters, [:])
        XCTAssertEqual(event.excludedTags, [])
        XCTAssertEqual(event.requiredTags, [])
    }

    func testSupportAddingParameters() {
        let event = "some event name" + ["key": "value"]
        XCTAssertEqual(event.name, "some event name")
        XCTAssertEqual(event.parameters, ["key": "value"])
        XCTAssertEqual(event.excludedTags, [])
        XCTAssertEqual(event.requiredTags, [])
    }

    func testSupportAddingRequiredTag() {
        let event: Event = "some event name" + Tag.debugging
        XCTAssertEqual(event.name, "some event name")
        XCTAssertEqual(event.parameters, [:])
        XCTAssertEqual(event.excludedTags, [])
        XCTAssertEqual(event.requiredTags, [.debugging])
    }

    func testSupportAddingRequiredTags() {
        let event = NamedEvent("some event name") + [.analytics, .debugging]
        XCTAssertEqual(event.name, "some event name")
        XCTAssertEqual(event.parameters, [:])
        XCTAssertEqual(event.excludedTags, [])
        XCTAssertEqual(event.requiredTags, [.analytics, .debugging])
    }

    func testSupportAddingExcludedTag() {
        let event: Event = "some event name" - Tag.crashReporting
        XCTAssertEqual(event.name, "some event name")
        XCTAssertEqual(event.parameters, [:])
        XCTAssertEqual(event.excludedTags, [.crashReporting])
        XCTAssertEqual(event.requiredTags, [])
    }

    func testSupportAddingExcludedTags() {
        let event = NamedEvent("some event name") - [.debugging, .crashReporting]
        XCTAssertEqual(event.name, "some event name")
        XCTAssertEqual(event.parameters, [:])
        XCTAssertEqual(event.excludedTags, [.debugging, .crashReporting])
        XCTAssertEqual(event.requiredTags, [])
    }
}
