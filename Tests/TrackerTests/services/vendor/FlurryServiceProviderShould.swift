@testable import Tracker
import TrackerTesting
import XCTest

final class FlurryServiceProviderShould: XCTestCase {
    var sut: FlurryServiceProvider!
    var adapter: FlurryServiceAdapterMock.Type!

    var someEvent: EventMock!
    var anotherEvent: EventMock!
    var someScreen: FirebaseAnalyticsScreenMock!
    var anotherScreen: ScreenMock!

    var someEventName: String!
    var anotherEventName: String!
    var parameters: [String: String]!
    var someScreenName: String!
    var someScreenClass: String!
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
        someScreenClass = "some screen class"
        anotherScreenName = "another screen name"
        somePropertyKey = "some property key"
        somePropertyValue = "some property value"
        someUserId = "some userId"

        someEvent = EventMock(name: someEventName, parameters: parameters)
        anotherEvent = EventMock(name: anotherEventName)
        someScreen = FirebaseAnalyticsScreenMock()
        someScreen.name = someScreenName
        someScreen.screenClass = someScreenClass
        anotherScreen = ScreenMock(name: anotherScreenName)

        adapter = FlurryServiceAdapterMock.self
        sut = FlurryServiceProvider(adapter: adapter)
    }

    override func tearDown() {
        super.tearDown()
        receivedEventDescription = nil
    }

    func testTrackEventWithExpectedName() {
        sut.trackEvent(someEvent)
        XCTAssertTrue(adapter.logEventNameWithParametersCalled)
        XCTAssertEqual(adapter.logEventNameWithParametersReceivedArguments?.eventName, someEventName)
    }

    func testTrackEventWithExpectedParameters() {
        sut.trackEvent(someEvent)
        for (key, value) in someEvent.parameters {
            XCTAssertEqual(adapter.logEventNameWithParametersReceivedArguments?.parameters?[key] as? String, value)
        }
    }

    func testTrackEventWithExpectedScreenName() throws {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.logEventNameWithParametersCalled)
        try AssertTrue(adapter.logEventNameWithParametersReceivedArguments?.eventName.hasPrefix(someScreenName))
        try AssertTrue(adapter.logEventNameWithParametersReceivedArguments?.eventName.hasSuffix(" viewed"))
    }

    func testSetExpectedProperty() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertTrue(adapter.sessionPropertiesCalled)
        for (key, value) in adapter.sessionPropertiesReceivedProperties ?? [:] {
            XCTAssertEqual(key.base as? String, somePropertyKey)
            XCTAssertEqual(value as? String, somePropertyValue)
        }
    }

    func testRemovePropertiesOnResetProperties() throws {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        sut.resetProperties()
        XCTAssertTrue(adapter.sessionPropertiesCalled)
        try AssertTrue(adapter.sessionPropertiesReceivedProperties?.isEmpty)
    }

    func testSetExpectedUserId() {
        sut.setUserId(someUserId)
        XCTAssertTrue(adapter.setUserIDCalled)
        XCTAssertEqual(adapter.setUserIDReceivedUserID, someUserId)
    }

    func testResetUserId() {
        sut.setUserId(someUserId)
        sut.resetUserId()
        XCTAssertTrue(adapter.setUserIDCalled)
        XCTAssertNil(adapter.setUserIDReceivedUserID)
    }

    func testDisableTracking() {
        sut.disableTracking(true)
        XCTAssertTrue(sut.trackingDisabled)
    }

    func testEnableTracking() {
        sut.disableTracking(false)
        XCTAssertFalse(sut.trackingDisabled)
    }
}
