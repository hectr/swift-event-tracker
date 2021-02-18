@testable import Tracker
import TrackerTesting
import XCTest

final class FacebookServiceProviderShould: XCTestCase {
    var sut: FacebookServiceProvider!
    var adapter: FacebookServiceAdapterMock.Type!
    var settingsAdapter: FacebookSettingsAdapterMock.Type!

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

        adapter = FacebookServiceAdapterMock.self
        settingsAdapter = FacebookSettingsAdapterMock.self
        sut = FacebookServiceProvider(adapter: adapter, settingsAdapter: settingsAdapter)
    }

    override func tearDown() {
        super.tearDown()
        receivedEventDescription = nil
    }

    func testTrackEventWithExpectedName() {
        sut.trackEvent(someEvent)
        XCTAssertTrue(adapter.logEventParametersCalled)
        XCTAssertEqual(adapter.logEventParametersReceivedArguments?.eventName, someEventName)
    }

    func testTrackEventWithExpectedParameters() {
        sut.trackEvent(someEvent)
        for (key, value) in someEvent.parameters {
            XCTAssertEqual(adapter.logEventParametersReceivedArguments?.parameters[key] as? String, value)
        }
    }

    func testTrackEventWithExpectedScreenName() throws {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.logEventParametersCalled)
        try AssertTrue(adapter.logEventParametersReceivedArguments?.eventName.hasPrefix(someScreenName))
        try AssertTrue(adapter.logEventParametersReceivedArguments?.eventName.hasSuffix(" viewed"))
    }

    func testSetExpectedProperty() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertTrue(adapter.logEventParametersCalled)
        XCTAssertEqual(adapter.logEventParametersReceivedArguments?.eventName, "Set property")
    }

    func testV6SetExpectedProperty() {
        let adapter = FacebookV6ServiceAdapterMock.self
        sut = FacebookServiceProvider(adapter: adapter, settingsAdapter: settingsAdapter)
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertTrue(adapter.updateUserPropertiesCalled)
        for (key, value) in adapter.updateUserPropertiesReceivedProperties ?? [:] {
            XCTAssertEqual(key, somePropertyKey)
            XCTAssertEqual(value as? String, somePropertyValue)
        }
    }

    func testRemovePropertiesOnResetProperties() throws {
        sut.resetProperties()
        XCTAssertTrue(adapter.logEventParametersCalled)
        XCTAssertEqual(adapter.logEventParametersReceivedArguments?.eventName, "Reset properties")
    }

    func testV6RemovePropertiesOnResetProperties() throws {
        let adapter = FacebookV6ServiceAdapterMock.self
        sut = FacebookServiceProvider(adapter: adapter, settingsAdapter: settingsAdapter)
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        sut.resetProperties()
        XCTAssertEqual(adapter.updateUserPropertiesCallsCount, 2)
        try AssertTrue(adapter.updateUserPropertiesReceivedProperties?.isEmpty)
    }

    func testSetExpectedUserId() {
        sut.setUserId(someUserId)
        XCTAssertEqual(adapter.userID, someUserId)
    }

    func testResetUserId() throws {
        sut.setUserId(someUserId)
        sut.resetUserId()
        XCTAssertNil(adapter.userID)
    }

    func testDisableTracking() throws {
        sut.disableTracking(true)
        XCTAssertTrue(settingsAdapter.isAutoLogAppEventsEnabled)
        XCTAssertTrue(sut.trackingDisabled)
    }

    func testEnableTracking() throws {
        sut.disableTracking(false)
        XCTAssertFalse(settingsAdapter.isAutoLogAppEventsEnabled)
        XCTAssertFalse(sut.trackingDisabled)
    }
}
