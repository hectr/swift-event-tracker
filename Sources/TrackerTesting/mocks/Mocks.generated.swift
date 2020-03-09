// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import Tracker

// MARK: - Event

public class EventMock: Event {

    public init() {}

    public var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    public var underlyingName: String!

    public var parameters: [String: String] = [:]

    public var excludedTags: [Tag] = []

    public var requiredTags: [Tag] = []

}

// MARK: - Screen

public class ScreenMock: Screen {

    public init() {}

    public var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    public var underlyingName: String!

    public var excludedTags: [Tag] = []

    public var requiredTags: [Tag] = []

}

// MARK: - Service

public class ServiceMock: Service {

    public init() {}

    public var supportedTags: [Tag] = []

    public var trackingDisabled: Bool {
        get { return underlyingTrackingDisabled }
        set(value) { underlyingTrackingDisabled = value }
    }
    public var underlyingTrackingDisabled: Bool!

    // MARK: trackEvent

    public var trackEventCallsCount = 0
    public var trackEventCalled: Bool {
        return trackEventCallsCount > 0
    }
    public var trackEventReceivedEvent: Event?
    public var trackEventReceivedInvocations: [Event] = []
    public var trackEventClosure: ((Event) -> Void)?

    public func trackEvent(_ event: Event) {
        trackEventCallsCount += 1
        trackEventReceivedEvent = event
        trackEventReceivedInvocations.append(event)
        trackEventClosure?(event)
    }

    // MARK: setUserId

    public var setUserIdCallsCount = 0
    public var setUserIdCalled: Bool {
        return setUserIdCallsCount > 0
    }
    public var setUserIdReceivedUserId: String?
    public var setUserIdReceivedInvocations: [String] = []
    public var setUserIdClosure: ((String) -> Void)?

    public func setUserId(_ userId: String) {
        setUserIdCallsCount += 1
        setUserIdReceivedUserId = userId
        setUserIdReceivedInvocations.append(userId)
        setUserIdClosure?(userId)
    }

    // MARK: resetUserId

    public var resetUserIdCallsCount = 0
    public var resetUserIdCalled: Bool {
        return resetUserIdCallsCount > 0
    }
    public var resetUserIdClosure: (() -> Void)?

    public func resetUserId() {
        resetUserIdCallsCount += 1
        resetUserIdClosure?()
    }

    // MARK: setProperty

    public var setPropertyValueCallsCount = 0
    public var setPropertyValueCalled: Bool {
        return setPropertyValueCallsCount > 0
    }
    public var setPropertyValueReceivedArguments: (key: String, value: String)?
    public var setPropertyValueReceivedInvocations: [(key: String, value: String)] = []
    public var setPropertyValueClosure: ((String, String) -> Void)?

    public func setProperty(_ key: String, value: String) {
        setPropertyValueCallsCount += 1
        setPropertyValueReceivedArguments = (key: key, value: value)
        setPropertyValueReceivedInvocations.append((key: key, value: value))
        setPropertyValueClosure?(key, value)
    }

    // MARK: resetProperties

    public var resetPropertiesCallsCount = 0
    public var resetPropertiesCalled: Bool {
        return resetPropertiesCallsCount > 0
    }
    public var resetPropertiesClosure: (() -> Void)?

    public func resetProperties() {
        resetPropertiesCallsCount += 1
        resetPropertiesClosure?()
    }

    // MARK: trackScreen

    public var trackScreenCallsCount = 0
    public var trackScreenCalled: Bool {
        return trackScreenCallsCount > 0
    }
    public var trackScreenReceivedScreen: Screen?
    public var trackScreenReceivedInvocations: [Screen] = []
    public var trackScreenClosure: ((Screen) -> Void)?

    public func trackScreen(_ screen: Screen) {
        trackScreenCallsCount += 1
        trackScreenReceivedScreen = screen
        trackScreenReceivedInvocations.append(screen)
        trackScreenClosure?(screen)
    }

    // MARK: disableTracking

    public var disableTrackingCallsCount = 0
    public var disableTrackingCalled: Bool {
        return disableTrackingCallsCount > 0
    }
    public var disableTrackingReceivedFlag: Bool?
    public var disableTrackingReceivedInvocations: [Bool] = []
    public var disableTrackingClosure: ((Bool) -> Void)?

    public func disableTracking(_ flag: Bool) {
        disableTrackingCallsCount += 1
        disableTrackingReceivedFlag = flag
        disableTrackingReceivedInvocations.append(flag)
        disableTrackingClosure?(flag)
    }

}

// MARK: - Taggable

public class TaggableMock: Taggable {

    public init() {}

    public var excludedTags: [Tag] = []

    public var requiredTags: [Tag] = []

}
