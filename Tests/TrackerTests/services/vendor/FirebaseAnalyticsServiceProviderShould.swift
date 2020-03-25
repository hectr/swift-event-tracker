@testable import Tracker
import TrackerTesting
import XCTest

final class FirebaseAnalyticsServiceProviderShould: XCTestCase {
    var sut: FirebaseAnalyticsServiceProvider!
    var adapter: FirebaseAnalyticsServiceAdapterMock.Type!

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

        adapter = FirebaseAnalyticsServiceAdapterMock.self
        sut = FirebaseAnalyticsServiceProvider(adapter: adapter)
    }

    override func tearDown() {
        super.tearDown()
        receivedEventDescription = nil
    }

    func testTrackEventWithExpectedName() {
        sut.trackEvent(someEvent)
        XCTAssertTrue(adapter.logEventParametersCalled)
        XCTAssertEqual(adapter.logEventParametersReceivedArguments?.name, someEventName)
    }

    func testTrackEventWithExpectedParameters() {
        sut.trackEvent(someEvent)
        for (key, value) in someEvent.parameters {
            XCTAssertEqual(adapter.logEventParametersReceivedArguments?.parameters?[key] as? String, value)
        }
    }

    func testTrackScreenWithExpectedName() {
        sut.trackScreen(anotherScreen)
        XCTAssertTrue(adapter.setScreenNameScreenClassCalled)
        XCTAssertEqual(adapter.setScreenNameScreenClassReceivedArguments?.name, anotherScreenName)
        XCTAssertNil(adapter.setScreenNameScreenClassReceivedArguments?.screenClass)
    }

    func testTrackScreenWithExpectedScreenClass() {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.setScreenNameScreenClassCalled)
        XCTAssertEqual(adapter.setScreenNameScreenClassReceivedArguments?.name, someScreenName)
        XCTAssertEqual(adapter.setScreenNameScreenClassReceivedArguments?.screenClass, someScreenClass)
    }

    func testSetExpectedProperty() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertTrue(adapter.setUserPropertyForNameCalled)
        XCTAssertEqual(adapter.setUserPropertyForNameReceivedArguments?.forName, somePropertyKey)
        XCTAssertEqual(adapter.setUserPropertyForNameReceivedArguments?.value, somePropertyValue)
    }

    func testRemovePropertiesOnResetProperties() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        sut.resetProperties()
        XCTAssertEqual(adapter.setUserPropertyForNameCallsCount, 2)
        XCTAssertEqual(adapter.setUserPropertyForNameReceivedArguments?.forName, somePropertyKey)
        XCTAssertNil(adapter.setUserPropertyForNameReceivedArguments?.value)
    }

    func testSetExpectedUserId() {
        sut.setUserId(someUserId)
        XCTAssertTrue(adapter.setUserIDCalled)
        XCTAssertEqual(adapter.setUserIDReceivedUserId, someUserId)
    }

    func testResetUserId() {
        sut.setUserId(someUserId)
        sut.resetUserId()
        XCTAssertTrue(adapter.setUserIDCalled)
        XCTAssertNil(adapter.setUserIDReceivedUserId)
    }

    func testDisableTracking() throws {
        sut.disableTracking(true)
        XCTAssertTrue(adapter.setAnalyticsCollectionEnabledCalled)
        try AssertFalse(adapter.setAnalyticsCollectionEnabledReceivedEnabled)
        XCTAssertTrue(sut.trackingDisabled)
    }

    func testEnableTracking() throws {
        sut.disableTracking(false)
        XCTAssertTrue(adapter.setAnalyticsCollectionEnabledCalled)
        try AssertTrue(adapter.setAnalyticsCollectionEnabledReceivedEnabled)
        XCTAssertFalse(sut.trackingDisabled)
    }
}
