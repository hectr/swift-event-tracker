@testable import Tracker
import TrackerTesting
import XCTest

final class MixpanelServiceProviderShould: XCTestCase {
    var sut: MixpanelServiceProvider!
    var adapter: MixpanelServiceAdapterMock!

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

        adapter = MixpanelServiceAdapterMock()
        sut = MixpanelServiceProvider(adapter: adapter)
    }

    override func tearDown() {
        super.tearDown()
        receivedEventDescription = nil
    }

    func testTrackEventWithExpectedName() {
        sut.trackEvent(someEvent)
        XCTAssertTrue(adapter.trackEventPropertiesCalled)
        XCTAssertEqual(adapter.trackEventPropertiesReceivedArguments?.event, someEventName)
    }

    func testTrackEventWithExpectedParameters() {
        sut.trackEvent(someEvent)
        for (key, value) in someEvent.parameters {
            XCTAssertEqual(adapter.trackEventPropertiesReceivedArguments?.properties?[key] as? String, value)
        }
    }

    func testTrackEventWithExpectedScreenName() throws {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.trackEventPropertiesCalled)
        try AssertTrue(adapter.trackEventPropertiesReceivedArguments?.event?.hasPrefix(someScreenName))
        try AssertTrue(adapter.trackEventPropertiesReceivedArguments?.event?.hasSuffix(" viewed"))
    }

    func testSetExpectedProperty() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertTrue(adapter.setPropertyToCalled)
        XCTAssertEqual(adapter.setPropertyToReceivedArguments?.property, somePropertyKey)
        XCTAssertEqual(adapter.setPropertyToReceivedArguments?.value, somePropertyValue)
    }

    func testRemovePropertiesOnResetProperties() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        sut.resetProperties()
        XCTAssertTrue(adapter.unsetPropertiesCalled)
        XCTAssertEqual(adapter.unsetPropertiesReceivedProperties, [somePropertyKey])
    }

    func testSetExpectedUserId() {
        sut.setUserId(someUserId)
        XCTAssertEqual(adapter.userId, someUserId)
    }

    func testResetUserId() {
        sut.setUserId(someUserId)
        sut.resetUserId()
        XCTAssertNil(adapter.userId)
    }

    func testDisableTracking() {
        sut.disableTracking(true)
        XCTAssertTrue(adapter.optOutTrackingCalled)
        adapter.hasOptedOutTrackingReturnValue = true
        XCTAssertTrue(sut.trackingDisabled)
    }

    func testEnableTracking() {
        sut.disableTracking(true)
        sut.disableTracking(false)
        XCTAssertTrue(adapter.optInTrackingDistinctIdPropertiesCalled)
        adapter.hasOptedOutTrackingReturnValue = false
        XCTAssertFalse(sut.trackingDisabled)
    }
}
