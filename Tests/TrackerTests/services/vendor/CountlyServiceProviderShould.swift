@testable import Tracker
import TrackerTesting
import XCTest

final class CountlyServiceProviderShould: XCTestCase {
    var sut: CountlyServiceProvider!
    var adapter: CountlyServiceAdapterMock!
    var userAdapter: CountlyUserDetailsAdapterMock!

    var someEvent: EventMock!
    var anotherEvent: EventMock!
    var someScreen: CountlyScreenMock!
    var anotherScreen: ScreenMock!

    var someEventName: String!
    var anotherEventName: String!
    var parameters: [String: String]!
    var someScreenName: String!
    var someScreenSegmentation: [String: String]!
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
        someScreenSegmentation = ["some key": "some value"]
        anotherScreenName = "another screen name"
        somePropertyKey = "some property key"
        somePropertyValue = "some property value"
        someUserId = "some userId"

        someEvent = EventMock(name: someEventName, parameters: parameters)
        anotherEvent = EventMock(name: anotherEventName)
        someScreen = CountlyScreenMock()
        someScreen.name = someScreenName
        someScreen.segmentation = someScreenSegmentation
        anotherScreen = ScreenMock(name: anotherScreenName)

        userAdapter = CountlyUserDetailsAdapterMock()
        adapter = CountlyServiceAdapterMock()
        sut = CountlyServiceProvider(adapter: adapter, userAdapter: userAdapter)
    }

    override func tearDown() {
        super.tearDown()
        receivedEventDescription = nil
    }

    func testTrackEventWithExpectedName() {
        sut.trackEvent(someEvent)
        XCTAssertTrue(adapter.recordEventSegmentationCalled)
        XCTAssertEqual(adapter.recordEventSegmentationReceivedArguments?.eventName, someEventName)
    }

    func testTrackEventWithExpectedParameters() {
        sut.trackEvent(someEvent)
        for (key, value) in someEvent.parameters {
            XCTAssertEqual(adapter.recordEventSegmentationReceivedArguments?.segmentation?[key], value)
        }
    }

    func testTrackScreenWithExpectedName() {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.recordViewSegmentationCalled)
        XCTAssertEqual(adapter.recordViewSegmentationReceivedArguments?.view, someScreenName)
    }

    func testTrackEventWithExpectedScreenName() {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.recordViewSegmentationCalled)
        XCTAssertEqual(adapter.recordViewSegmentationReceivedArguments?.view, someScreenName)
    }

    func testTrackScreenWithExpectedSegmentation() {
        sut.trackScreen(someScreen)
        XCTAssertTrue(adapter.recordViewSegmentationCalled)
        for (key, value) in someScreen.segmentation {
            XCTAssertEqual(adapter.recordViewSegmentationReceivedArguments?.segmentation[key], value)
        }
    }

    func testSetExpectedProperty() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertTrue(userAdapter.setValueCalled)
        XCTAssertEqual(userAdapter.setValueReceivedArguments?.key, somePropertyKey)
        XCTAssertEqual(userAdapter.setValueReceivedArguments?.value, somePropertyValue)
    }

    func testRemovePropertiesOnResetProperties() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        sut.resetProperties()
        XCTAssertTrue(userAdapter.unSetCalled)
        XCTAssertEqual(userAdapter.unSetReceivedKey, somePropertyKey)
    }

    func testSetExpectedUserId() {
        sut.setUserId(someUserId)
        XCTAssertTrue(adapter.userLoggedInCalled)
        XCTAssertEqual(adapter.userLoggedInReceivedUserID, someUserId)
    }

    func testResetUserId() {
        sut.setUserId(someUserId)
        sut.resetUserId()
        XCTAssertTrue(adapter.userLoggedOutCalled)
    }

    func testDisableTracking() {
        sut.disableTracking(true)
        XCTAssertTrue(adapter.cancelConsentForAllFeaturesCalled)
        XCTAssertTrue(sut.trackingDisabled)
    }

    func testEnableTracking() {
        sut.disableTracking(false)
        XCTAssertTrue(adapter.giveConsentForAllFeaturesCalled)
        XCTAssertFalse(sut.trackingDisabled)
    }
}
