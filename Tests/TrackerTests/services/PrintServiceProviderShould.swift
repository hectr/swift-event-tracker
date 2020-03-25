@testable import Tracker
import TrackerTesting
import XCTest

final class PrintServiceProviderShould: XCTestCase {
    var sut: PrintServiceProvider!

    var someEvent: EventMock!
    var anotherEvent: EventMock!
    var someScreen: ScreenMock!

    var someEventName: String!
    var anotherEventName: String!
    var parameters: [String: String]!
    var someScreenName: String!
    var somePropertyKey: String!
    var somePropertyValue: String!
    var someUserId: String!

    var receivedEventDescription: String?

    override func setUp() {
        super.setUp()
        someEventName = "some event name"
        anotherEventName = "another event name"
        parameters = ["param0": "value0", "param1": "value1"]
        someScreenName = "some screen name"
        somePropertyKey = "some property key"
        somePropertyValue = "some property value"
        someUserId = "some userId"

        someEvent = EventMock(name: someEventName, parameters: parameters)
        anotherEvent = EventMock(name: anotherEventName)
        someScreen = ScreenMock(name: someScreenName)

        sut = PrintServiceProvider(canBeDisabled: false) { eventdescription in
            self.receivedEventDescription = eventdescription
        }
    }

    override func tearDown() {
        super.tearDown()
        receivedEventDescription = nil
    }

    func testTrackEventWithExpectedName() throws {
        sut.trackEvent(someEvent)
        try AssertTrue(receivedEventDescription?.contains(someEventName))
    }

    func testTrackEventWithExpectedParameters() throws {
        sut.trackEvent(someEvent)
        for (key, value) in someEvent.parameters {
            try AssertTrue(receivedEventDescription?.contains(key), "\"\(receivedEventDescription ?? "nil")\" does not contain \"\(key)\"")
            try AssertTrue(receivedEventDescription?.contains(value), "\"\(receivedEventDescription ?? "nil")\" does not contain \"\(value)\"")
        }
    }

    func testTrackEventWithExpectedScreenName() throws {
        sut.trackScreen(someScreen)
        try AssertTrue(receivedEventDescription?.contains(someScreenName))
    }

    func testTrackEventWithExpectedPropertyKey() throws {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        try AssertTrue(receivedEventDescription?.contains(somePropertyKey))
    }

    func testTrackEventWithExpectedPropertyValue() throws {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        try AssertTrue(receivedEventDescription?.contains(somePropertyValue))
    }

    func testRemovePropertiesOnResetProperties() throws {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        sut.resetProperties()
        try AssertTrue(receivedEventDescription?.contains("Reset properties"))
    }

    func testTrackEventWithExpectedUserId() throws {
        sut.setUserId(someUserId)
        try AssertTrue(receivedEventDescription?.contains(someUserId))
    }

    func testTrackEventOnResetUserId() throws {
        sut.resetUserId()
        try AssertTrue(receivedEventDescription?.contains("Reset user"))
    }

    func testInformWhenTrackingDisabled() {
        sut.disableTracking(true)
        XCTAssertEqual(receivedEventDescription, "Disabling tracking")
    }

    func testUpdateTrackingDisabledPropertyOnlyWhenCanBeDisabled() {
        let provider = PrintServiceProvider(canBeDisabled: true) { eventdescription in
            self.receivedEventDescription = eventdescription
        }
        provider.disableTracking(true)
        sut.disableTracking(true)
        XCTAssertTrue(provider.trackingDisabled)
        XCTAssertFalse(sut.trackingDisabled)
    }
}
