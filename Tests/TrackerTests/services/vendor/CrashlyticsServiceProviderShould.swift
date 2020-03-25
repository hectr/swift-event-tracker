@testable import Tracker
import TrackerTesting
import XCTest

final class CrashlyticsServiceProviderShould: XCTestCase {
    var sut: CrashlyticsServiceProvider!
    var adapter: CrashlyticsServiceAdapterMock!

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

        adapter = CrashlyticsServiceAdapterMock()
        sut = CrashlyticsServiceProvider(adapter: adapter)
    }

    override func tearDown() {
        super.tearDown()
        receivedEventDescription = nil
    }

    func testTrackEventWithExpectedName() {
        sut.trackEvent(someEvent)
        XCTAssertTrue(adapter.logCalled)
        XCTAssertEqual(adapter.logReceivedMsg, someEventName)
    }

    func testTrackEventWithExpectedParameters() {
        sut.trackEvent(someEvent)
        XCTAssertEqual(adapter.setCustomValueForKeyCallsCount, 2)
    }

    func testTrackEventWithExpectedScreenName() throws {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.logCalled)
        try AssertTrue(adapter.logReceivedMsg?.hasPrefix(someScreenName))
        try AssertTrue(adapter.logReceivedMsg?.hasSuffix(" viewed"))
    }

    func testSetExpectedProperty() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertTrue(adapter.setCustomValueForKeyCalled)
        XCTAssertEqual(adapter.setCustomValueForKeyReceivedArguments?.forKey, somePropertyKey)
        XCTAssertEqual(adapter.setCustomValueForKeyReceivedArguments?.value as? String, somePropertyValue)
    }

    func testRemovePropertiesOnResetProperties() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        sut.resetProperties()
        XCTAssertEqual(adapter.setCustomValueForKeyReceivedArguments?.forKey, somePropertyKey)
        XCTAssertEqual(adapter.setCustomValueForKeyReceivedArguments?.value as? String, "")
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
        XCTAssertEqual(adapter.setUserIDReceivedUserId, "")
    }

    func testDisableTracking() throws {
        sut.disableTracking(true)
        XCTAssertTrue(adapter.setCrashlyticsCollectionEnabledCalled)
        try AssertFalse(adapter.setCrashlyticsCollectionEnabledReceivedFlag)
        adapter.isCrashlyticsCollectionEnabledReturnValue = false
        XCTAssertTrue(sut.trackingDisabled)
    }

    func testEnableTracking() throws {
        sut.disableTracking(false)
        XCTAssertTrue(adapter.setCrashlyticsCollectionEnabledCalled)
        try AssertTrue(adapter.setCrashlyticsCollectionEnabledReceivedFlag)
        adapter.isCrashlyticsCollectionEnabledReturnValue = true
        XCTAssertFalse(sut.trackingDisabled)
    }
}
