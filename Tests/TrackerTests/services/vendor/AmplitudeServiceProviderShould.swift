@testable import Tracker
import TrackerTesting
import XCTest

final class AmplitudeServiceProviderShould: XCTestCase {
    var sut: AmplitudeServiceProvider!
    var adapter: AmplitudeServiceAdapterMock!

    var someEvent: EventMock!
    var anotherEvent: EventMock!
    var someScreen: FirebaseAnalyticsScreenMock!
    var anotherScreen: ScreenMock!

    var someEventName: String!
    var anotherEventName: String!
    var parameters: [String: String]!
    var someScreenName: String!
    var anotherScreenName: String!
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
        anotherScreenName = "another screen name"
        somePropertyKey = "some property key"
        somePropertyValue = "some property value"
        someUserId = "some userId"

        someEvent = EventMock(name: someEventName, parameters: parameters)
        anotherEvent = EventMock(name: anotherEventName)
        someScreen = FirebaseAnalyticsScreenMock()
        someScreen.name = someScreenName
        anotherScreen = ScreenMock(name: anotherScreenName)

        adapter = AmplitudeServiceAdapterMock()
        sut = AmplitudeServiceProvider(adapter: adapter)
    }

    override func tearDown() {
        super.tearDown()
        receivedEventDescription = nil
    }

    func testTrackEventWithExpectedName() {
        sut.trackEvent(someEvent)
        XCTAssertTrue(adapter.logEventWithEventPropertiesCalled)
        XCTAssertEqual(adapter.logEventWithEventPropertiesReceivedArguments?.eventType, someEventName)
    }

    func testTrackEventWithExpectedParameters() {
        sut.trackEvent(someEvent)
        for (key, value) in someEvent.parameters {
            XCTAssertEqual(adapter.logEventWithEventPropertiesReceivedArguments?.withEventProperties?[key] as? String, value)
        }
    }

    func testTrackEventWithExpectedScreenName() throws {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.logEventWithEventPropertiesCalled)
        try AssertTrue(adapter.logEventWithEventPropertiesReceivedArguments?.eventType?.hasPrefix(someScreenName))
        try AssertTrue(adapter.logEventWithEventPropertiesReceivedArguments?.eventType?.hasSuffix(" viewed"))
    }

    func testSetExpectedProperty() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertTrue(adapter.setUserPropertiesCalled)
        for (key, value) in adapter.setUserPropertiesReceivedDictionary ?? [:] {
            XCTAssertEqual(key.base as? String, somePropertyKey)
            XCTAssertEqual(value as? String, somePropertyValue)
        }
    }

    func testRemovePropertiesOnResetProperties() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        sut.resetProperties()
        XCTAssertTrue(adapter.clearUserPropertiesCalled)
    }

    func testSetExpectedUserId() {
        sut.setUserId(someUserId)
        XCTAssertTrue(adapter.setUserIdCalled)
        XCTAssertEqual(adapter.setUserIdReceivedId, someUserId)
    }

    func testResetUserId() {
        sut.setUserId(someUserId)
        sut.resetUserId()
        XCTAssertTrue(adapter.setUserIdCalled)
        XCTAssertNil(adapter.setUserIdReceivedId)
    }

    func testDisableTracking() {
        sut.disableTracking(true)
        XCTAssertTrue(adapter.optOut)
        XCTAssertTrue(sut.trackingDisabled)
    }

    func testEnableTracking() {
        sut.disableTracking(false)
        XCTAssertFalse(adapter.optOut)
        XCTAssertFalse(sut.trackingDisabled)
    }
}
