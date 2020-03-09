@testable import Tracker
import TrackerTesting
import XCTest

final class ServiceShould: XCTestCase {
    let sut = ServiceMock(tags: [.debugging])

    func testImplementContainsAny() {
        XCTAssertTrue(sut.containsAny(from: [.crashReporting, .debugging]))
        XCTAssertFalse(sut.containsAny(from: [.crashReporting]))
    }

    func testImplementContainsNone() {
        XCTAssertTrue(sut.containsNone(from: [.crashReporting, .analytics]))
        XCTAssertFalse(sut.containsNone(from: [.crashReporting, .debugging]))
    }}
