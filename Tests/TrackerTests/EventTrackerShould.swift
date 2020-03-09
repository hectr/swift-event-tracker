@testable import Tracker
import TrackerTesting
import XCTest

final class EventTrackerShould: XCTestCase {
    var sut: EventTracker!

    var someProvider: ServiceMock!
    var anotherProvider: ServiceMock!
    var someEvent: Event!
    var anotherEvent: Event!
    var debuggingEvent: Event!
    var nonAnalyticsEvent: Event!
    var someScreen: ScreenMock!
    var anotherScreen: ScreenMock!

    var someEventName: String!
    var debuggingEventName: String!
    var nonAnalyticsEventName: String!
    var anotherEventName: String!
    var parameters: [String: String]!
    var someScreenName: String!
    var anotherScreenName: String!
    var somePropertyKey: String!
    var somePropertyValue: String!
    var someUserId: String!

    override func setUp() {
        super.setUp()
        someEventName = "some event name"
        anotherEventName = "another event name"
        debuggingEventName = "debugging event name"
        nonAnalyticsEventName = "non analytics event name"
        parameters = ["param0": "value0", "param1": "value1"]
        someScreenName = "some screen name"
        anotherScreenName = "another screen name"
        somePropertyKey = "some property name"
        somePropertyValue = "some property value"
        someUserId = "some userId"

        someProvider = ServiceMock(tags: [.crashReporting, .debugging])
        anotherProvider = ServiceMock(tags: [.analytics])
        someEvent = NamedEvent(someEventName) + parameters
        anotherEvent = EventMock(name: anotherEventName)
        debuggingEvent = NamedEvent(debuggingEventName) + [.debugging]
        nonAnalyticsEvent = NamedEvent(nonAnalyticsEventName) - [.analytics]
        someScreen = ScreenMock(name: someScreenName)
        anotherScreen = ScreenMock(name: anotherScreenName)

        sut = EventTracker(serviceProviders: [someProvider, anotherProvider])
    }

    func testSetServiceProviders() {
        sut.setServiceProviders([someProvider])
        sut.trackEvent(someEvent)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, someEvent.name)
        XCTAssertNil(anotherProvider.trackEventReceivedEvent)
        sut.setServiceProviders([anotherProvider])
        sut.trackEvent(anotherEvent)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, someEvent.name)
        XCTAssertEqual(anotherProvider.trackEventReceivedEvent?.name, anotherEvent.name)
    }

    func testTrackEventsOnlyIfConditionIsMet() {
        sut.trackEvent(someEvent, given: { true })
        sut.trackEvent(anotherEvent, given: { false })
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, someEventName)
        XCTAssertNotEqual(someProvider.trackEventReceivedEvent?.name, anotherEventName)
    }

    func testTrackEventsOnlyIfAutoclosureConditionIsMet() {
        sut.trackEvent(someEvent, given: true)
        sut.trackEvent(anotherEvent, given: false)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, someEventName)
        XCTAssertNotEqual(someProvider.trackEventReceivedEvent?.name, anotherEventName)
    }

    func testExecuteTrackedEventThenOnlyIfConditionIsMet() {
        var executed = false
        sut.trackEvent(someEvent, given: { true }, then: { executed = true })
        sut.trackEvent(anotherEvent, given: { false }, then: { XCTFail("must not invoke then when given condition is not met") })
        XCTAssertTrue(executed)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, someEventName)
        XCTAssertNotEqual(someProvider.trackEventReceivedEvent?.name, anotherEventName)
    }

    func testExecuteTrackedEventThenOnlyIfAutoclosureConditionIsMet() {
        var executed = false
        sut.trackEvent(someEvent, given: true, then: executed = true)
        sut.trackEvent(anotherEvent, given: false, then: XCTFail("must not invoke then when given condition is not met"))
        XCTAssertTrue(executed)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, someEventName)
        XCTAssertNotEqual(someProvider.trackEventReceivedEvent?.name, anotherEventName)
    }

    func testTrackEventsOnlyIfServiceProviderContainsRequiredTags() {
        sut.trackEvent(debuggingEvent)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, debuggingEventName)
        XCTAssertNil(anotherProvider.trackEventReceivedEvent)
    }

    func testTrackEventsOnlyIfServiceProviderDoesNotContainExcludedTags() {
        sut.trackEvent(nonAnalyticsEvent)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, nonAnalyticsEventName)
        XCTAssertNil(anotherProvider.trackEventReceivedEvent)
    }

    func testTrackEventsWithExpectedName() {
        sut.trackEvent(someEvent)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.name, someEventName)
        XCTAssertEqual(anotherProvider.trackEventReceivedEvent?.name, someEventName)
    }

    func testTrackEventsWithExpectedParameters() {
        sut.trackEvent(someEvent)
        XCTAssertEqual(someProvider.trackEventReceivedEvent?.parameters, parameters)
    }

    func testTrackEventsWithExpectedPropertyKeys() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertEqual(someProvider.setPropertyValueReceivedArguments?.key, somePropertyKey)
    }

    func testTrackEventsWithExpectedPropertyValues() {
        sut.setProperty(somePropertyKey, value: somePropertyValue)
        XCTAssertEqual(someProvider.setPropertyValueReceivedArguments?.value, somePropertyValue)
    }

    func testTrackScreensWithExpectedName() {
        sut.trackScreen(someScreen)
        XCTAssertEqual(someProvider.trackScreenReceivedScreen?.name, someScreenName)
    }

    func testTrackScreenOnlyIfConditionIsMet() {
        sut.trackScreen(someScreen, given: { true })
        sut.trackScreen(anotherScreen, given: { false })
        XCTAssertEqual(someProvider.trackScreenReceivedScreen?.name, someScreenName)
        XCTAssertNotEqual(someProvider.trackScreenReceivedScreen?.name, anotherScreenName)
    }

    func testTrackScreenOnlyIfAutoclosureConditionIsMet() {
        sut.trackScreen(someScreen, given: true)
        sut.trackScreen(anotherScreen, given: false)
        XCTAssertEqual(someProvider.trackScreenReceivedScreen?.name, someScreenName)
        XCTAssertNotEqual(someProvider.trackScreenReceivedScreen?.name, anotherScreenName)
    }

    func testExecuteTrackedScreenThenOnlyIfConditionIsMet() {
        var executed = false
        sut.trackScreen(someScreen, given: { true }, then: { executed = true })
        sut.trackScreen(anotherScreen, given: { false }, then: { XCTFail("must not invoke then when given condition is not met") })
        XCTAssertTrue(executed)
        XCTAssertEqual(someProvider.trackScreenReceivedScreen?.name, someScreenName)
        XCTAssertNotEqual(someProvider.trackScreenReceivedScreen?.name, anotherScreenName)
    }

    func testExecuteTrackedScreenThenOnlyIfAutoclosureConditionIsMet() {
        var executed = false
        sut.trackScreen(someScreen, given: true, then: executed = true)
        sut.trackScreen(anotherScreen, given: false, then: XCTFail("must not invoke then when given condition is not met"))
        XCTAssertTrue(executed)
        XCTAssertEqual(someProvider.trackScreenReceivedScreen?.name, someScreenName)
        XCTAssertNotEqual(someProvider.trackScreenReceivedScreen?.name, anotherScreenName)
    }

    func testSetExpectedUserId() {
        sut.setUserId(someUserId)
        XCTAssertEqual(someProvider.setUserIdReceivedUserId, someUserId)
    }

    func testSetExpectedUserIdOnlyIfTagsMatch() {
        sut.setUserId(someUserId, forTags: [.analytics])
        XCTAssertNil(someProvider.setUserIdReceivedUserId)
        XCTAssertEqual(anotherProvider.setUserIdReceivedUserId, someUserId)
    }

    func testForwardSetPropertiesToProviders() {
        sut.resetProperties()
        XCTAssertTrue(someProvider.resetPropertiesCalled)
    }

    func testForwardSetPropertiesToProvidersOnlyIfTagsMatch() {
        sut.setProperty("key", value: "value", forTags: [.debugging])
        XCTAssertTrue(someProvider.setPropertyValueCalled)
        XCTAssertFalse(anotherProvider.setPropertyValueCalled)
    }

    func testForwardResetPropertiesToProviders() {
        sut.resetProperties()
        XCTAssertTrue(someProvider.resetPropertiesCalled)
    }

    func testForwardResetPropertiesToProvidersOnlyIfTagsMatch() {
        sut.resetProperties(forTags: [.debugging])
        XCTAssertTrue(someProvider.resetPropertiesCalled)
        XCTAssertFalse(anotherProvider.resetPropertiesCalled)
    }

    func testForwardTrackingDisabledToProviders() throws {
        XCTAssertFalse(someProvider.trackingDisabled)
        sut.disableTracking(true)
        try AssertTrue(someProvider.disableTrackingReceivedFlag)
    }
}
