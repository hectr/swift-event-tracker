@testable import Tracker
import XCTest

final class TaggedScreenShould: XCTestCase {
    let sut = TaggedScreen(name: "some screen name",
                           excludedTags: [.crashReporting],
                           requiredTags: [.analytics])

    func testSupportAddingRequiredTag() {
        let screen = sut + .debugging
        XCTAssertEqual(screen.name, sut.name)
        XCTAssertEqual(screen.excludedTags, sut.excludedTags)
        XCTAssertEqual(screen.requiredTags, [.analytics, .debugging])
    }

    func testSupportAddingRequiredTags() {
        let screen = sut + [.analytics, .debugging]
        XCTAssertEqual(screen.name, sut.name)
        XCTAssertEqual(screen.excludedTags, sut.excludedTags)
        XCTAssertEqual(screen.requiredTags, [.analytics, .analytics, .debugging])
    }

    func testSupportAddingExcludedTag() {
        let screen = sut - .crashReporting
        XCTAssertEqual(screen.name, sut.name)
        XCTAssertEqual(screen.excludedTags, [.crashReporting, .crashReporting])
        XCTAssertEqual(screen.requiredTags, sut.requiredTags)
    }

    func testSupportAddingExcludedTags() {
        let screen = sut - [.debugging, .crashReporting]
        XCTAssertEqual(screen.name, sut.name)
        XCTAssertEqual(screen.excludedTags, [.crashReporting, .debugging, .crashReporting])
        XCTAssertEqual(screen.requiredTags, sut.requiredTags)
    }
}
