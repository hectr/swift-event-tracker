// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import Tracker

// MARK: - AdjustServiceAdapter

public class AdjustServiceAdapterMock: AdjustServiceAdapter {

    public init() {}

    // MARK: trackEvent

    public static var trackEventParametersCallsCount = 0
    public static var trackEventParametersCalled: Bool {
        return trackEventParametersCallsCount > 0
    }
    public static var trackEventParametersReceivedArguments: (eventName: String, parameters: [String: String])?
    public static var trackEventParametersReceivedInvocations: [(eventName: String, parameters: [String: String])] = []
    public static var trackEventParametersClosure: ((String, [String: String]) -> Void)?

    public static func trackEvent(_ eventName: String, parameters: [String: String]) {
        trackEventParametersCallsCount += 1
        trackEventParametersReceivedArguments = (eventName: eventName, parameters: parameters)
        trackEventParametersReceivedInvocations.append((eventName: eventName, parameters: parameters))
        trackEventParametersClosure?(eventName, parameters)
    }

    // MARK: setEnabled

    public static var setEnabledCallsCount = 0
    public static var setEnabledCalled: Bool {
        return setEnabledCallsCount > 0
    }
    public static var setEnabledReceivedFlag: Bool?
    public static var setEnabledReceivedInvocations: [Bool] = []
    public static var setEnabledClosure: ((Bool) -> Void)?

    public static func setEnabled(_ flag: Bool) {
        setEnabledCallsCount += 1
        setEnabledReceivedFlag = flag
        setEnabledReceivedInvocations.append(flag)
        setEnabledClosure?(flag)
    }

}

// MARK: - AmplitudeServiceAdapter

public class AmplitudeServiceAdapterMock: AmplitudeServiceAdapter {

    public init() {}

    public var optOut: Bool {
        get { return underlyingOptOut }
        set(value) { underlyingOptOut = value }
    }
    public var underlyingOptOut: Bool!

    // MARK: clearUserProperties

    public var clearUserPropertiesCallsCount = 0
    public var clearUserPropertiesCalled: Bool {
        return clearUserPropertiesCallsCount > 0
    }
    public var clearUserPropertiesClosure: (() -> Void)?

    public func clearUserProperties() {
        clearUserPropertiesCallsCount += 1
        clearUserPropertiesClosure?()
    }

    // MARK: logEvent

    public var logEventWithEventPropertiesCallsCount = 0
    public var logEventWithEventPropertiesCalled: Bool {
        return logEventWithEventPropertiesCallsCount > 0
    }
    public var logEventWithEventPropertiesReceivedArguments: (eventType: String?, withEventProperties: [AnyHashable: Any]?)?
    public var logEventWithEventPropertiesReceivedInvocations: [(eventType: String?, withEventProperties: [AnyHashable: Any]?)] = []
    public var logEventWithEventPropertiesClosure: ((String?, [AnyHashable: Any]?) -> Void)?

    public func logEvent(_ eventType: String!, withEventProperties: [AnyHashable: Any]!) {
        logEventWithEventPropertiesCallsCount += 1
        logEventWithEventPropertiesReceivedArguments = (eventType: eventType, withEventProperties: withEventProperties)
        logEventWithEventPropertiesReceivedInvocations.append((eventType: eventType, withEventProperties: withEventProperties))
        logEventWithEventPropertiesClosure?(eventType, withEventProperties)
    }

    // MARK: regenerateDeviceId

    public var regenerateDeviceIdCallsCount = 0
    public var regenerateDeviceIdCalled: Bool {
        return regenerateDeviceIdCallsCount > 0
    }
    public var regenerateDeviceIdClosure: (() -> Void)?

    public func regenerateDeviceId() {
        regenerateDeviceIdCallsCount += 1
        regenerateDeviceIdClosure?()
    }

    // MARK: setUserId

    public var setUserIdCallsCount = 0
    public var setUserIdCalled: Bool {
        return setUserIdCallsCount > 0
    }
    public var setUserIdReceivedId: String?
    public var setUserIdReceivedInvocations: [String?] = []
    public var setUserIdClosure: ((String?) -> Void)?

    public func setUserId(_ id: String!) {
        setUserIdCallsCount += 1
        setUserIdReceivedId = id
        setUserIdReceivedInvocations.append(id)
        setUserIdClosure?(id)
    }

    // MARK: setUserProperties

    public var setUserPropertiesCallsCount = 0
    public var setUserPropertiesCalled: Bool {
        return setUserPropertiesCallsCount > 0
    }
    public var setUserPropertiesReceivedDictionary: [AnyHashable: Any]?
    public var setUserPropertiesReceivedInvocations: [[AnyHashable: Any]?] = []
    public var setUserPropertiesClosure: (([AnyHashable: Any]?) -> Void)?

    public func setUserProperties(_ dictionary: [AnyHashable: Any]!) {
        setUserPropertiesCallsCount += 1
        setUserPropertiesReceivedDictionary = dictionary
        setUserPropertiesReceivedInvocations.append(dictionary)
        setUserPropertiesClosure?(dictionary)
    }

}

// MARK: - AppCenterAnalyticsServiceAdapter

public class AppCenterAnalyticsServiceAdapterMock: AppCenterAnalyticsServiceAdapter {

    public init() {}

    // MARK: pause

    public static var pauseCallsCount = 0
    public static var pauseCalled: Bool {
        return pauseCallsCount > 0
    }
    public static var pauseClosure: (() -> Void)?

    public static func pause() {
        pauseCallsCount += 1
        pauseClosure?()
    }

    // MARK: resume

    public static var resumeCallsCount = 0
    public static var resumeCalled: Bool {
        return resumeCallsCount > 0
    }
    public static var resumeClosure: (() -> Void)?

    public static func resume() {
        resumeCallsCount += 1
        resumeClosure?()
    }

    // MARK: trackEvent

    public static var trackEventWithPropertiesCallsCount = 0
    public static var trackEventWithPropertiesCalled: Bool {
        return trackEventWithPropertiesCallsCount > 0
    }
    public static var trackEventWithPropertiesReceivedArguments: (eventName: String, properties: [String: String]?)?
    public static var trackEventWithPropertiesReceivedInvocations: [(eventName: String, properties: [String: String]?)] = []
    public static var trackEventWithPropertiesClosure: ((String, [String: String]?) -> Void)?

    public static func trackEvent(_ eventName: String, withProperties properties: [String: String]?) {
        trackEventWithPropertiesCallsCount += 1
        trackEventWithPropertiesReceivedArguments = (eventName: eventName, properties: properties)
        trackEventWithPropertiesReceivedInvocations.append((eventName: eventName, properties: properties))
        trackEventWithPropertiesClosure?(eventName, properties)
    }

}

// MARK: - AppsFlyerServiceAdapter

public class AppsFlyerServiceAdapterMock: AppsFlyerServiceAdapter {

    public init() {}

    public var customData: [AnyHashable: Any]?

    public var customerUserID: String?

    public var isStopTracking: Bool {
        get { return underlyingIsStopTracking }
        set(value) { underlyingIsStopTracking = value }
    }
    public var underlyingIsStopTracking: Bool!

    // MARK: trackEvent

    public var trackEventWithValuesCallsCount = 0
    public var trackEventWithValuesCalled: Bool {
        return trackEventWithValuesCallsCount > 0
    }
    public var trackEventWithValuesReceivedArguments: (eventName: String, withValues: [AnyHashable: Any]?)?
    public var trackEventWithValuesReceivedInvocations: [(eventName: String, withValues: [AnyHashable: Any]?)] = []
    public var trackEventWithValuesClosure: ((String, [AnyHashable: Any]?) -> Void)?

    public func trackEvent(_ eventName: String, withValues: [AnyHashable: Any]?) {
        trackEventWithValuesCallsCount += 1
        trackEventWithValuesReceivedArguments = (eventName: eventName, withValues: withValues)
        trackEventWithValuesReceivedInvocations.append((eventName: eventName, withValues: withValues))
        trackEventWithValuesClosure?(eventName, withValues)
    }

}

// MARK: - AppseeAnalyticsScreen

public class AppseeAnalyticsScreenMock: AppseeAnalyticsScreen {

    public init() {}

    public var actions: [String] = []

    public var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    public var underlyingName: String!

    public var excludedTags: [Tag] = []

    public var requiredTags: [Tag] = []

}

// MARK: - AppseeAnalyticsServiceAdapter

public class AppseeAnalyticsServiceAdapterMock: AppseeAnalyticsServiceAdapter {

    public init() {}

    // MARK: addEvent

    public static var addEventWithPropertiesCallsCount = 0
    public static var addEventWithPropertiesCalled: Bool {
        return addEventWithPropertiesCallsCount > 0
    }
    public static var addEventWithPropertiesReceivedArguments: (eventName: String?, properties: [AnyHashable: Any]?)?
    public static var addEventWithPropertiesReceivedInvocations: [(eventName: String?, properties: [AnyHashable: Any]?)] = []
    public static var addEventWithPropertiesClosure: ((String?, [AnyHashable: Any]?) -> Void)?

    public static func addEvent(_ eventName: String!, withProperties properties: [AnyHashable: Any]!) {
        addEventWithPropertiesCallsCount += 1
        addEventWithPropertiesReceivedArguments = (eventName: eventName, properties: properties)
        addEventWithPropertiesReceivedInvocations.append((eventName: eventName, properties: properties))
        addEventWithPropertiesClosure?(eventName, properties)
    }

    // MARK: addScreenAction

    public static var addScreenActionCallsCount = 0
    public static var addScreenActionCalled: Bool {
        return addScreenActionCallsCount > 0
    }
    public static var addScreenActionReceivedActionName: String?
    public static var addScreenActionReceivedInvocations: [String?] = []
    public static var addScreenActionClosure: ((String?) -> Void)?

    public static func addScreenAction(_ actionName: String!) {
        addScreenActionCallsCount += 1
        addScreenActionReceivedActionName = actionName
        addScreenActionReceivedInvocations.append(actionName)
        addScreenActionClosure?(actionName)
    }

    // MARK: deleteCurrentUserData

    public static var deleteCurrentUserDataCallsCount = 0
    public static var deleteCurrentUserDataCalled: Bool {
        return deleteCurrentUserDataCallsCount > 0
    }
    public static var deleteCurrentUserDataReturnValue: Bool!
    public static var deleteCurrentUserDataClosure: (() -> Bool)?

    public static func deleteCurrentUserData() -> Bool {
        deleteCurrentUserDataCallsCount += 1
        return deleteCurrentUserDataClosure.map({ $0() }) ?? deleteCurrentUserDataReturnValue
    }

    // MARK: getOptOutStatus

    public static var getOptOutStatusCallsCount = 0
    public static var getOptOutStatusCalled: Bool {
        return getOptOutStatusCallsCount > 0
    }
    public static var getOptOutStatusReturnValue: Bool!
    public static var getOptOutStatusClosure: (() -> Bool)?

    public static func getOptOutStatus() -> Bool {
        getOptOutStatusCallsCount += 1
        return getOptOutStatusClosure.map({ $0() }) ?? getOptOutStatusReturnValue
    }

    // MARK: setOptOutStatus

    public static var setOptOutStatusCallsCount = 0
    public static var setOptOutStatusCalled: Bool {
        return setOptOutStatusCallsCount > 0
    }
    public static var setOptOutStatusReceivedFlag: Bool?
    public static var setOptOutStatusReceivedInvocations: [Bool] = []
    public static var setOptOutStatusClosure: ((Bool) -> Void)?

    public static func setOptOutStatus(_ flag: Bool) {
        setOptOutStatusCallsCount += 1
        setOptOutStatusReceivedFlag = flag
        setOptOutStatusReceivedInvocations.append(flag)
        setOptOutStatusClosure?(flag)
    }

    // MARK: setUserID

    public static var setUserIDCallsCount = 0
    public static var setUserIDCalled: Bool {
        return setUserIDCallsCount > 0
    }
    public static var setUserIDReceivedUserID: String?
    public static var setUserIDReceivedInvocations: [String?] = []
    public static var setUserIDClosure: ((String?) -> Void)?

    public static func setUserID(_ userID: String!) {
        setUserIDCallsCount += 1
        setUserIDReceivedUserID = userID
        setUserIDReceivedInvocations.append(userID)
        setUserIDClosure?(userID)
    }

    // MARK: startScreen

    public static var startScreenCallsCount = 0
    public static var startScreenCalled: Bool {
        return startScreenCallsCount > 0
    }
    public static var startScreenReceivedScreenName: String?
    public static var startScreenReceivedInvocations: [String?] = []
    public static var startScreenClosure: ((String?) -> Void)?

    public static func startScreen(_ screenName: String!) {
        startScreenCallsCount += 1
        startScreenReceivedScreenName = screenName
        startScreenReceivedInvocations.append(screenName)
        startScreenClosure?(screenName)
    }

}

// MARK: - BrazeServiceAdapter

public class BrazeServiceAdapterMock: BrazeServiceAdapter {

    public init() {}

    // MARK: changeUser

    public var changeUserCallsCount = 0
    public var changeUserCalled: Bool {
        return changeUserCallsCount > 0
    }
    public var changeUserReceivedUserId: String?
    public var changeUserReceivedInvocations: [String] = []
    public var changeUserClosure: ((String) -> Void)?

    public func changeUser(_ userId: String) {
        changeUserCallsCount += 1
        changeUserReceivedUserId = userId
        changeUserReceivedInvocations.append(userId)
        changeUserClosure?(userId)
    }

    // MARK: logCustomEvent

    public var logCustomEventWithPropertiesCallsCount = 0
    public var logCustomEventWithPropertiesCalled: Bool {
        return logCustomEventWithPropertiesCallsCount > 0
    }
    public var logCustomEventWithPropertiesReceivedArguments: (eventName: String, withProperties: [AnyHashable: Any]?)?
    public var logCustomEventWithPropertiesReceivedInvocations: [(eventName: String, withProperties: [AnyHashable: Any]?)] = []
    public var logCustomEventWithPropertiesClosure: ((String, [AnyHashable: Any]?) -> Void)?

    public func logCustomEvent(_ eventName: String, withProperties: [AnyHashable: Any]?) {
        logCustomEventWithPropertiesCallsCount += 1
        logCustomEventWithPropertiesReceivedArguments = (eventName: eventName, withProperties: withProperties)
        logCustomEventWithPropertiesReceivedInvocations.append((eventName: eventName, withProperties: withProperties))
        logCustomEventWithPropertiesClosure?(eventName, withProperties)
    }

    // MARK: setCustomAttributeWithKey

    public var setCustomAttributeWithKeyAndStringValueCallsCount = 0
    public var setCustomAttributeWithKeyAndStringValueCalled: Bool {
        return setCustomAttributeWithKeyAndStringValueCallsCount > 0
    }
    public var setCustomAttributeWithKeyAndStringValueReceivedArguments: (key: String, value: String)?
    public var setCustomAttributeWithKeyAndStringValueReceivedInvocations: [(key: String, value: String)] = []
    public var setCustomAttributeWithKeyAndStringValueClosure: ((String, String) -> Void)?

    public func setCustomAttributeWithKey(_ key: String, andStringValue value: String) {
        setCustomAttributeWithKeyAndStringValueCallsCount += 1
        setCustomAttributeWithKeyAndStringValueReceivedArguments = (key: key, value: value)
        setCustomAttributeWithKeyAndStringValueReceivedInvocations.append((key: key, value: value))
        setCustomAttributeWithKeyAndStringValueClosure?(key, value)
    }

    // MARK: unsetCustomAttributeWithKey

    public var unsetCustomAttributeWithKeyCallsCount = 0
    public var unsetCustomAttributeWithKeyCalled: Bool {
        return unsetCustomAttributeWithKeyCallsCount > 0
    }
    public var unsetCustomAttributeWithKeyReceivedKey: String?
    public var unsetCustomAttributeWithKeyReceivedInvocations: [String] = []
    public var unsetCustomAttributeWithKeyClosure: ((String) -> Void)?

    public func unsetCustomAttributeWithKey(_ key: String) {
        unsetCustomAttributeWithKeyCallsCount += 1
        unsetCustomAttributeWithKeyReceivedKey = key
        unsetCustomAttributeWithKeyReceivedInvocations.append(key)
        unsetCustomAttributeWithKeyClosure?(key)
    }

}

// MARK: - BugseeServiceAdapter

public class BugseeServiceAdapterMock: BugseeServiceAdapter {

    public init() {}

    // MARK: clearAllAttribute

    public static var clearAllAttributeCallsCount = 0
    public static var clearAllAttributeCalled: Bool {
        return clearAllAttributeCallsCount > 0
    }
    public static var clearAllAttributeReturnValue: Bool!
    public static var clearAllAttributeClosure: (() -> Bool)?

    public static func clearAllAttribute() -> Bool {
        clearAllAttributeCallsCount += 1
        return clearAllAttributeClosure.map({ $0() }) ?? clearAllAttributeReturnValue
    }

    // MARK: event

    public static var eventParamsCallsCount = 0
    public static var eventParamsCalled: Bool {
        return eventParamsCallsCount > 0
    }
    public static var eventParamsReceivedArguments: (eventName: String, params: [AnyHashable: Any])?
    public static var eventParamsReceivedInvocations: [(eventName: String, params: [AnyHashable: Any])] = []
    public static var eventParamsClosure: ((String, [AnyHashable: Any]) -> Void)?

    public static func event(_ eventName: String, params: [AnyHashable: Any]) {
        eventParamsCallsCount += 1
        eventParamsReceivedArguments = (eventName: eventName, params: params)
        eventParamsReceivedInvocations.append((eventName: eventName, params: params))
        eventParamsClosure?(eventName, params)
    }

    // MARK: pause

    public static var pauseCallsCount = 0
    public static var pauseCalled: Bool {
        return pauseCallsCount > 0
    }
    public static var pauseClosure: (() -> Void)?

    public static func pause() {
        pauseCallsCount += 1
        pauseClosure?()
    }

    // MARK: resume

    public static var resumeCallsCount = 0
    public static var resumeCalled: Bool {
        return resumeCallsCount > 0
    }
    public static var resumeClosure: (() -> Void)?

    public static func resume() {
        resumeCallsCount += 1
        resumeClosure?()
    }

    // MARK: setAttribute

    public static var setAttributeValueCallsCount = 0
    public static var setAttributeValueCalled: Bool {
        return setAttributeValueCallsCount > 0
    }
    public static var setAttributeValueReceivedArguments: (key: String, value: Any)?
    public static var setAttributeValueReceivedInvocations: [(key: String, value: Any)] = []
    public static var setAttributeValueReturnValue: Bool!
    public static var setAttributeValueClosure: ((String, Any) -> Bool)?

    public static func setAttribute(_ key: String, value: Any) -> Bool {
        setAttributeValueCallsCount += 1
        setAttributeValueReceivedArguments = (key: key, value: value)
        setAttributeValueReceivedInvocations.append((key: key, value: value))
        return setAttributeValueClosure.map({ $0(key, value) }) ?? setAttributeValueReturnValue
    }

}

// MARK: - CountlyScreen

public class CountlyScreenMock: CountlyScreen {

    public init() {}

    public var segmentation: [String: String] = [:]

    public var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    public var underlyingName: String!

    public var excludedTags: [Tag] = []

    public var requiredTags: [Tag] = []

}

// MARK: - CountlyServiceAdapter

public class CountlyServiceAdapterMock: CountlyServiceAdapter {

    public init() {}

    // MARK: recordEvent

    public var recordEventSegmentationCallsCount = 0
    public var recordEventSegmentationCalled: Bool {
        return recordEventSegmentationCallsCount > 0
    }
    public var recordEventSegmentationReceivedArguments: (eventName: String, segmentation: [String: String]?)?
    public var recordEventSegmentationReceivedInvocations: [(eventName: String, segmentation: [String: String]?)] = []
    public var recordEventSegmentationClosure: ((String, [String: String]?) -> Void)?

    public func recordEvent(_ eventName: String, segmentation: [String: String]?) {
        recordEventSegmentationCallsCount += 1
        recordEventSegmentationReceivedArguments = (eventName: eventName, segmentation: segmentation)
        recordEventSegmentationReceivedInvocations.append((eventName: eventName, segmentation: segmentation))
        recordEventSegmentationClosure?(eventName, segmentation)
    }

    // MARK: recordView

    public var recordViewCallsCount = 0
    public var recordViewCalled: Bool {
        return recordViewCallsCount > 0
    }
    public var recordViewReceivedView: String?
    public var recordViewReceivedInvocations: [String] = []
    public var recordViewClosure: ((String) -> Void)?

    public func recordView(_ view: String) {
        recordViewCallsCount += 1
        recordViewReceivedView = view
        recordViewReceivedInvocations.append(view)
        recordViewClosure?(view)
    }

    // MARK: recordView

    public var recordViewSegmentationCallsCount = 0
    public var recordViewSegmentationCalled: Bool {
        return recordViewSegmentationCallsCount > 0
    }
    public var recordViewSegmentationReceivedArguments: (view: String, segmentation: [String: String])?
    public var recordViewSegmentationReceivedInvocations: [(view: String, segmentation: [String: String])] = []
    public var recordViewSegmentationClosure: ((String, [String: String]) -> Void)?

    public func recordView(_ view: String, segmentation: [String: String]) {
        recordViewSegmentationCallsCount += 1
        recordViewSegmentationReceivedArguments = (view: view, segmentation: segmentation)
        recordViewSegmentationReceivedInvocations.append((view: view, segmentation: segmentation))
        recordViewSegmentationClosure?(view, segmentation)
    }

    // MARK: userLogged

    public var userLoggedInCallsCount = 0
    public var userLoggedInCalled: Bool {
        return userLoggedInCallsCount > 0
    }
    public var userLoggedInReceivedUserID: String?
    public var userLoggedInReceivedInvocations: [String] = []
    public var userLoggedInClosure: ((String) -> Void)?

    public func userLogged(in userID: String) {
        userLoggedInCallsCount += 1
        userLoggedInReceivedUserID = userID
        userLoggedInReceivedInvocations.append(userID)
        userLoggedInClosure?(userID)
    }

    // MARK: userLoggedOut

    public var userLoggedOutCallsCount = 0
    public var userLoggedOutCalled: Bool {
        return userLoggedOutCallsCount > 0
    }
    public var userLoggedOutClosure: (() -> Void)?

    public func userLoggedOut() {
        userLoggedOutCallsCount += 1
        userLoggedOutClosure?()
    }

    // MARK: giveConsentForAllFeatures

    public var giveConsentForAllFeaturesCallsCount = 0
    public var giveConsentForAllFeaturesCalled: Bool {
        return giveConsentForAllFeaturesCallsCount > 0
    }
    public var giveConsentForAllFeaturesClosure: (() -> Void)?

    public func giveConsentForAllFeatures() {
        giveConsentForAllFeaturesCallsCount += 1
        giveConsentForAllFeaturesClosure?()
    }

    // MARK: cancelConsentForAllFeatures

    public var cancelConsentForAllFeaturesCallsCount = 0
    public var cancelConsentForAllFeaturesCalled: Bool {
        return cancelConsentForAllFeaturesCallsCount > 0
    }
    public var cancelConsentForAllFeaturesClosure: (() -> Void)?

    public func cancelConsentForAllFeatures() {
        cancelConsentForAllFeaturesCallsCount += 1
        cancelConsentForAllFeaturesClosure?()
    }

}

// MARK: - CountlyUserDetailsAdapter

public class CountlyUserDetailsAdapterMock: CountlyUserDetailsAdapter {

    public init() {}

    // MARK: set

    public var setValueCallsCount = 0
    public var setValueCalled: Bool {
        return setValueCallsCount > 0
    }
    public var setValueReceivedArguments: (key: String, value: String)?
    public var setValueReceivedInvocations: [(key: String, value: String)] = []
    public var setValueClosure: ((String, String) -> Void)?

    public func set(_ key: String, value: String) {
        setValueCallsCount += 1
        setValueReceivedArguments = (key: key, value: value)
        setValueReceivedInvocations.append((key: key, value: value))
        setValueClosure?(key, value)
    }

    // MARK: unSet

    public var unSetCallsCount = 0
    public var unSetCalled: Bool {
        return unSetCallsCount > 0
    }
    public var unSetReceivedKey: String?
    public var unSetReceivedInvocations: [String] = []
    public var unSetClosure: ((String) -> Void)?

    public func unSet(_ key: String) {
        unSetCallsCount += 1
        unSetReceivedKey = key
        unSetReceivedInvocations.append(key)
        unSetClosure?(key)
    }

}

// MARK: - CrashlyticsServiceAdapter

public class CrashlyticsServiceAdapterMock: CrashlyticsServiceAdapter {

    public init() {}

    // MARK: deleteUnsentReports

    public var deleteUnsentReportsCallsCount = 0
    public var deleteUnsentReportsCalled: Bool {
        return deleteUnsentReportsCallsCount > 0
    }
    public var deleteUnsentReportsClosure: (() -> Void)?

    public func deleteUnsentReports() {
        deleteUnsentReportsCallsCount += 1
        deleteUnsentReportsClosure?()
    }

    // MARK: log

    public var logCallsCount = 0
    public var logCalled: Bool {
        return logCallsCount > 0
    }
    public var logReceivedMsg: String?
    public var logReceivedInvocations: [String] = []
    public var logClosure: ((String) -> Void)?

    public func log(_ msg: String) {
        logCallsCount += 1
        logReceivedMsg = msg
        logReceivedInvocations.append(msg)
        logClosure?(msg)
    }

    // MARK: record

    public var recordErrorCallsCount = 0
    public var recordErrorCalled: Bool {
        return recordErrorCallsCount > 0
    }
    public var recordErrorReceivedError: Swift.Error?
    public var recordErrorReceivedInvocations: [Swift.Error] = []
    public var recordErrorClosure: ((Swift.Error) -> Void)?

    public func record(error: Swift.Error) {
        recordErrorCallsCount += 1
        recordErrorReceivedError = error
        recordErrorReceivedInvocations.append(error)
        recordErrorClosure?(error)
    }

    // MARK: setCrashlyticsCollectionEnabled

    public var setCrashlyticsCollectionEnabledCallsCount = 0
    public var setCrashlyticsCollectionEnabledCalled: Bool {
        return setCrashlyticsCollectionEnabledCallsCount > 0
    }
    public var setCrashlyticsCollectionEnabledReceivedFlag: Bool?
    public var setCrashlyticsCollectionEnabledReceivedInvocations: [Bool] = []
    public var setCrashlyticsCollectionEnabledClosure: ((Bool) -> Void)?

    public func setCrashlyticsCollectionEnabled(_ flag: Bool) {
        setCrashlyticsCollectionEnabledCallsCount += 1
        setCrashlyticsCollectionEnabledReceivedFlag = flag
        setCrashlyticsCollectionEnabledReceivedInvocations.append(flag)
        setCrashlyticsCollectionEnabledClosure?(flag)
    }

    // MARK: isCrashlyticsCollectionEnabled

    public var isCrashlyticsCollectionEnabledCallsCount = 0
    public var isCrashlyticsCollectionEnabledCalled: Bool {
        return isCrashlyticsCollectionEnabledCallsCount > 0
    }
    public var isCrashlyticsCollectionEnabledReturnValue: Bool!
    public var isCrashlyticsCollectionEnabledClosure: (() -> Bool)?

    public func isCrashlyticsCollectionEnabled() -> Bool {
        isCrashlyticsCollectionEnabledCallsCount += 1
        return isCrashlyticsCollectionEnabledClosure.map({ $0() }) ?? isCrashlyticsCollectionEnabledReturnValue
    }

    // MARK: setCustomValue

    public var setCustomValueForKeyCallsCount = 0
    public var setCustomValueForKeyCalled: Bool {
        return setCustomValueForKeyCallsCount > 0
    }
    public var setCustomValueForKeyReceivedArguments: (value: Any, forKey: String)?
    public var setCustomValueForKeyReceivedInvocations: [(value: Any, forKey: String)] = []
    public var setCustomValueForKeyClosure: ((Any, String) -> Void)?

    public func setCustomValue(_ value: Any, forKey: String) {
        setCustomValueForKeyCallsCount += 1
        setCustomValueForKeyReceivedArguments = (value: value, forKey: forKey)
        setCustomValueForKeyReceivedInvocations.append((value: value, forKey: forKey))
        setCustomValueForKeyClosure?(value, forKey)
    }

    // MARK: setUserID

    public var setUserIDCallsCount = 0
    public var setUserIDCalled: Bool {
        return setUserIDCallsCount > 0
    }
    public var setUserIDReceivedUserId: String?
    public var setUserIDReceivedInvocations: [String] = []
    public var setUserIDClosure: ((String) -> Void)?

    public func setUserID(_ userId: String) {
        setUserIDCallsCount += 1
        setUserIDReceivedUserId = userId
        setUserIDReceivedInvocations.append(userId)
        setUserIDClosure?(userId)
    }

}

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

// MARK: - FacebookServiceAdapter

public class FacebookServiceAdapterMock: FacebookServiceAdapter {

    public init() {}

    public static var userID: String?

    // MARK: clearUserID

    public static var clearUserIDCallsCount = 0
    public static var clearUserIDCalled: Bool {
        return clearUserIDCallsCount > 0
    }
    public static var clearUserIDClosure: (() -> Void)?

    public static func clearUserID() {
        clearUserIDCallsCount += 1
        clearUserIDClosure?()
    }

    // MARK: logEvent

    public static var logEventParametersCallsCount = 0
    public static var logEventParametersCalled: Bool {
        return logEventParametersCallsCount > 0
    }
    public static var logEventParametersReceivedArguments: (eventName: String, parameters: [String : Any])?
    public static var logEventParametersReceivedInvocations: [(eventName: String, parameters: [String : Any])] = []
    public static var logEventParametersClosure: ((String, [String : Any]) -> Void)?

    public static func logEvent(_ eventName: String, parameters: [String : Any]) {
        logEventParametersCallsCount += 1
        logEventParametersReceivedArguments = (eventName: eventName, parameters: parameters)
        logEventParametersReceivedInvocations.append((eventName: eventName, parameters: parameters))
        logEventParametersClosure?(eventName, parameters)
    }

    // MARK: updateUserProperties

    public static var updateUserPropertiesCallsCount = 0
    public static var updateUserPropertiesCalled: Bool {
        return updateUserPropertiesCallsCount > 0
    }
    public static var updateUserPropertiesReceivedProperties: [String: Any]?
    public static var updateUserPropertiesReceivedInvocations: [[String: Any]] = []
    public static var updateUserPropertiesClosure: (([String: Any]) -> Void)?

    public static func updateUserProperties(_ properties: [String: Any]) {
        updateUserPropertiesCallsCount += 1
        updateUserPropertiesReceivedProperties = properties
        updateUserPropertiesReceivedInvocations.append(properties)
        updateUserPropertiesClosure?(properties)
    }

}

// MARK: - FacebookSettingsAdapter

public class FacebookSettingsAdapterMock: FacebookSettingsAdapter {

    public init() {}

    public static var isAutoLogAppEventsEnabled: Bool {
        get { return underlyingIsAutoLogAppEventsEnabled }
        set(value) { underlyingIsAutoLogAppEventsEnabled = value }
    }
    public static var underlyingIsAutoLogAppEventsEnabled: Bool!

}

// MARK: - FirebaseAnalyticsScreen

public class FirebaseAnalyticsScreenMock: FirebaseAnalyticsScreen {

    public init() {}

    public var screenClass: String {
        get { return underlyingScreenClass }
        set(value) { underlyingScreenClass = value }
    }
    public var underlyingScreenClass: String!

    public var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    public var underlyingName: String!

    public var excludedTags: [Tag] = []

    public var requiredTags: [Tag] = []

}

// MARK: - FirebaseAnalyticsServiceAdapter

public class FirebaseAnalyticsServiceAdapterMock: FirebaseAnalyticsServiceAdapter {

    public init() {}

    // MARK: logEvent

    public static var logEventParametersCallsCount = 0
    public static var logEventParametersCalled: Bool {
        return logEventParametersCallsCount > 0
    }
    public static var logEventParametersReceivedArguments: (name: String, parameters: [String: Any]?)?
    public static var logEventParametersReceivedInvocations: [(name: String, parameters: [String: Any]?)] = []
    public static var logEventParametersClosure: ((String, [String: Any]?) -> Void)?

    public static func logEvent(_ name: String, parameters: [String: Any]?) {
        logEventParametersCallsCount += 1
        logEventParametersReceivedArguments = (name: name, parameters: parameters)
        logEventParametersReceivedInvocations.append((name: name, parameters: parameters))
        logEventParametersClosure?(name, parameters)
    }

    // MARK: setAnalyticsCollectionEnabled

    public static var setAnalyticsCollectionEnabledCallsCount = 0
    public static var setAnalyticsCollectionEnabledCalled: Bool {
        return setAnalyticsCollectionEnabledCallsCount > 0
    }
    public static var setAnalyticsCollectionEnabledReceivedEnabled: Bool?
    public static var setAnalyticsCollectionEnabledReceivedInvocations: [Bool] = []
    public static var setAnalyticsCollectionEnabledClosure: ((Bool) -> Void)?

    public static func setAnalyticsCollectionEnabled(_ enabled: Bool) {
        setAnalyticsCollectionEnabledCallsCount += 1
        setAnalyticsCollectionEnabledReceivedEnabled = enabled
        setAnalyticsCollectionEnabledReceivedInvocations.append(enabled)
        setAnalyticsCollectionEnabledClosure?(enabled)
    }

    // MARK: setScreenName

    public static var setScreenNameScreenClassCallsCount = 0
    public static var setScreenNameScreenClassCalled: Bool {
        return setScreenNameScreenClassCallsCount > 0
    }
    public static var setScreenNameScreenClassReceivedArguments: (name: String?, screenClass: String?)?
    public static var setScreenNameScreenClassReceivedInvocations: [(name: String?, screenClass: String?)] = []
    public static var setScreenNameScreenClassClosure: ((String?, String?) -> Void)?

    public static func setScreenName(_ name: String?, screenClass: String?) {
        setScreenNameScreenClassCallsCount += 1
        setScreenNameScreenClassReceivedArguments = (name: name, screenClass: screenClass)
        setScreenNameScreenClassReceivedInvocations.append((name: name, screenClass: screenClass))
        setScreenNameScreenClassClosure?(name, screenClass)
    }

    // MARK: setUserID

    public static var setUserIDCallsCount = 0
    public static var setUserIDCalled: Bool {
        return setUserIDCallsCount > 0
    }
    public static var setUserIDReceivedUserId: String?
    public static var setUserIDReceivedInvocations: [String?] = []
    public static var setUserIDClosure: ((String?) -> Void)?

    public static func setUserID(_ userId: String?) {
        setUserIDCallsCount += 1
        setUserIDReceivedUserId = userId
        setUserIDReceivedInvocations.append(userId)
        setUserIDClosure?(userId)
    }

    // MARK: setUserProperty

    public static var setUserPropertyForNameCallsCount = 0
    public static var setUserPropertyForNameCalled: Bool {
        return setUserPropertyForNameCallsCount > 0
    }
    public static var setUserPropertyForNameReceivedArguments: (value: String?, forName: String)?
    public static var setUserPropertyForNameReceivedInvocations: [(value: String?, forName: String)] = []
    public static var setUserPropertyForNameClosure: ((String?, String) -> Void)?

    public static func setUserProperty(_ value: String?, forName: String) {
        setUserPropertyForNameCallsCount += 1
        setUserPropertyForNameReceivedArguments = (value: value, forName: forName)
        setUserPropertyForNameReceivedInvocations.append((value: value, forName: forName))
        setUserPropertyForNameClosure?(value, forName)
    }

}

// MARK: - FlurryServiceAdapter

public class FlurryServiceAdapterMock: FlurryServiceAdapter {

    public init() {}

    // MARK: log

    public static var logEventNameWithParametersCallsCount = 0
    public static var logEventNameWithParametersCalled: Bool {
        return logEventNameWithParametersCallsCount > 0
    }
    public static var logEventNameWithParametersReceivedArguments: (eventName: String, parameters: [AnyHashable: Any]?)?
    public static var logEventNameWithParametersReceivedInvocations: [(eventName: String, parameters: [AnyHashable: Any]?)] = []
    public static var logEventNameWithParametersClosure: ((String, [AnyHashable: Any]?) -> Void)?

    public static func log(eventName: String, withParameters parameters: [AnyHashable: Any]?) {
        logEventNameWithParametersCallsCount += 1
        logEventNameWithParametersReceivedArguments = (eventName: eventName, parameters: parameters)
        logEventNameWithParametersReceivedInvocations.append((eventName: eventName, parameters: parameters))
        logEventNameWithParametersClosure?(eventName, parameters)
    }

    // MARK: sessionProperties

    public static var sessionPropertiesCallsCount = 0
    public static var sessionPropertiesCalled: Bool {
        return sessionPropertiesCallsCount > 0
    }
    public static var sessionPropertiesReceivedProperties: [AnyHashable: Any]?
    public static var sessionPropertiesReceivedInvocations: [[AnyHashable: Any]] = []
    public static var sessionPropertiesClosure: (([AnyHashable: Any]) -> Void)?

    public static func sessionProperties(_ properties: [AnyHashable: Any]) {
        sessionPropertiesCallsCount += 1
        sessionPropertiesReceivedProperties = properties
        sessionPropertiesReceivedInvocations.append(properties)
        sessionPropertiesClosure?(properties)
    }

    // MARK: setUserID

    public static var setUserIDCallsCount = 0
    public static var setUserIDCalled: Bool {
        return setUserIDCallsCount > 0
    }
    public static var setUserIDReceivedUserID: String?
    public static var setUserIDReceivedInvocations: [String?] = []
    public static var setUserIDClosure: ((String?) -> Void)?

    public static func setUserID(_ userID: String?) {
        setUserIDCallsCount += 1
        setUserIDReceivedUserID = userID
        setUserIDReceivedInvocations.append(userID)
        setUserIDClosure?(userID)
    }

}

// MARK: - InstabugServiceAdapter

public class InstabugServiceAdapterMock: InstabugServiceAdapter {

    public init() {}

    // MARK: logUserEvent

    public static var logUserEventWithNameCallsCount = 0
    public static var logUserEventWithNameCalled: Bool {
        return logUserEventWithNameCallsCount > 0
    }
    public static var logUserEventWithNameReceivedWithName: String?
    public static var logUserEventWithNameReceivedInvocations: [String] = []
    public static var logUserEventWithNameClosure: ((String) -> Void)?

    public static func logUserEvent(withName: String) {
        logUserEventWithNameCallsCount += 1
        logUserEventWithNameReceivedWithName = withName
        logUserEventWithNameReceivedInvocations.append(withName)
        logUserEventWithNameClosure?(withName)
    }

    // MARK: removeUserAttribute

    public static var removeUserAttributeForKeyCallsCount = 0
    public static var removeUserAttributeForKeyCalled: Bool {
        return removeUserAttributeForKeyCallsCount > 0
    }
    public static var removeUserAttributeForKeyReceivedForKey: String?
    public static var removeUserAttributeForKeyReceivedInvocations: [String] = []
    public static var removeUserAttributeForKeyClosure: ((String) -> Void)?

    public static func removeUserAttribute(forKey: String) {
        removeUserAttributeForKeyCallsCount += 1
        removeUserAttributeForKeyReceivedForKey = forKey
        removeUserAttributeForKeyReceivedInvocations.append(forKey)
        removeUserAttributeForKeyClosure?(forKey)
    }

    // MARK: setUserAttribute

    public static var setUserAttributeWithKeyCallsCount = 0
    public static var setUserAttributeWithKeyCalled: Bool {
        return setUserAttributeWithKeyCallsCount > 0
    }
    public static var setUserAttributeWithKeyReceivedArguments: (value: String, withKey: String)?
    public static var setUserAttributeWithKeyReceivedInvocations: [(value: String, withKey: String)] = []
    public static var setUserAttributeWithKeyClosure: ((String, String) -> Void)?

    public static func setUserAttribute(_ value: String, withKey: String) {
        setUserAttributeWithKeyCallsCount += 1
        setUserAttributeWithKeyReceivedArguments = (value: value, withKey: withKey)
        setUserAttributeWithKeyReceivedInvocations.append((value: value, withKey: withKey))
        setUserAttributeWithKeyClosure?(value, withKey)
    }

}

// MARK: - MixpanelServiceAdapter

public class MixpanelServiceAdapterMock: MixpanelServiceAdapter {

    public init() {}

    public var userId: String?

    // MARK: hasOptedOutTracking

    public var hasOptedOutTrackingCallsCount = 0
    public var hasOptedOutTrackingCalled: Bool {
        return hasOptedOutTrackingCallsCount > 0
    }
    public var hasOptedOutTrackingReturnValue: Bool!
    public var hasOptedOutTrackingClosure: (() -> Bool)?

    public func hasOptedOutTracking() -> Bool {
        hasOptedOutTrackingCallsCount += 1
        return hasOptedOutTrackingClosure.map({ $0() }) ?? hasOptedOutTrackingReturnValue
    }

    // MARK: optInTracking

    public var optInTrackingDistinctIdPropertiesCallsCount = 0
    public var optInTrackingDistinctIdPropertiesCalled: Bool {
        return optInTrackingDistinctIdPropertiesCallsCount > 0
    }
    public var optInTrackingDistinctIdPropertiesReceivedArguments: (distinctId: String?, properties: [String: Any]?)?
    public var optInTrackingDistinctIdPropertiesReceivedInvocations: [(distinctId: String?, properties: [String: Any]?)] = []
    public var optInTrackingDistinctIdPropertiesClosure: ((String?, [String: Any]?) -> Void)?

    public func optInTracking(distinctId: String?, properties: [String: Any]?) {
        optInTrackingDistinctIdPropertiesCallsCount += 1
        optInTrackingDistinctIdPropertiesReceivedArguments = (distinctId: distinctId, properties: properties)
        optInTrackingDistinctIdPropertiesReceivedInvocations.append((distinctId: distinctId, properties: properties))
        optInTrackingDistinctIdPropertiesClosure?(distinctId, properties)
    }

    // MARK: optOutTracking

    public var optOutTrackingCallsCount = 0
    public var optOutTrackingCalled: Bool {
        return optOutTrackingCallsCount > 0
    }
    public var optOutTrackingClosure: (() -> Void)?

    public func optOutTracking() {
        optOutTrackingCallsCount += 1
        optOutTrackingClosure?()
    }

    // MARK: set

    public var setPropertyToCallsCount = 0
    public var setPropertyToCalled: Bool {
        return setPropertyToCallsCount > 0
    }
    public var setPropertyToReceivedArguments: (property: String, value: String)?
    public var setPropertyToReceivedInvocations: [(property: String, value: String)] = []
    public var setPropertyToClosure: ((String, String) -> Void)?

    public func set(property: String, to value: String) {
        setPropertyToCallsCount += 1
        setPropertyToReceivedArguments = (property: property, value: value)
        setPropertyToReceivedInvocations.append((property: property, value: value))
        setPropertyToClosure?(property, value)
    }

    // MARK: track

    public var trackEventPropertiesCallsCount = 0
    public var trackEventPropertiesCalled: Bool {
        return trackEventPropertiesCallsCount > 0
    }
    public var trackEventPropertiesReceivedArguments: (event: String?, properties: [String: Any]?)?
    public var trackEventPropertiesReceivedInvocations: [(event: String?, properties: [String: Any]?)] = []
    public var trackEventPropertiesClosure: ((String?, [String: Any]?) -> Void)?

    public func track(event: String?, properties: [String: Any]?) {
        trackEventPropertiesCallsCount += 1
        trackEventPropertiesReceivedArguments = (event: event, properties: properties)
        trackEventPropertiesReceivedInvocations.append((event: event, properties: properties))
        trackEventPropertiesClosure?(event, properties)
    }

    // MARK: unset

    public var unsetPropertiesCallsCount = 0
    public var unsetPropertiesCalled: Bool {
        return unsetPropertiesCallsCount > 0
    }
    public var unsetPropertiesReceivedProperties: [String]?
    public var unsetPropertiesReceivedInvocations: [[String]] = []
    public var unsetPropertiesClosure: (([String]) -> Void)?

    public func unset(properties: [String]) {
        unsetPropertiesCallsCount += 1
        unsetPropertiesReceivedProperties = properties
        unsetPropertiesReceivedInvocations.append(properties)
        unsetPropertiesClosure?(properties)
    }

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

// MARK: - TaplyticsServiceAdapter

public class TaplyticsServiceAdapterMock: TaplyticsServiceAdapter {

    public init() {}

    // MARK: hasUserOptedOutTracking

    public static var hasUserOptedOutTrackingCallsCount = 0
    public static var hasUserOptedOutTrackingCalled: Bool {
        return hasUserOptedOutTrackingCallsCount > 0
    }
    public static var hasUserOptedOutTrackingReturnValue: Bool!
    public static var hasUserOptedOutTrackingClosure: (() -> Bool)?

    public static func hasUserOptedOutTracking() -> Bool {
        hasUserOptedOutTrackingCallsCount += 1
        return hasUserOptedOutTrackingClosure.map({ $0() }) ?? hasUserOptedOutTrackingReturnValue
    }

    // MARK: logEvent

    public static var logEventCallsCount = 0
    public static var logEventCalled: Bool {
        return logEventCallsCount > 0
    }
    public static var logEventReceivedEventName: String?
    public static var logEventReceivedInvocations: [String] = []
    public static var logEventClosure: ((String) -> Void)?

    public static func logEvent(_ eventName: String) {
        logEventCallsCount += 1
        logEventReceivedEventName = eventName
        logEventReceivedInvocations.append(eventName)
        logEventClosure?(eventName)
    }

    // MARK: optOutUserTracking

    public static var optOutUserTrackingCallsCount = 0
    public static var optOutUserTrackingCalled: Bool {
        return optOutUserTrackingCallsCount > 0
    }
    public static var optOutUserTrackingClosure: (() -> Void)?

    public static func optOutUserTracking() {
        optOutUserTrackingCallsCount += 1
        optOutUserTrackingClosure?()
    }

    // MARK: optInUserTracking

    public static var optInUserTrackingCallsCount = 0
    public static var optInUserTrackingCalled: Bool {
        return optInUserTrackingCallsCount > 0
    }
    public static var optInUserTrackingClosure: (() -> Void)?

    public static func optInUserTracking() {
        optInUserTrackingCallsCount += 1
        optInUserTrackingClosure?()
    }

    // MARK: setUserAttributes

    public static var setUserAttributesCallsCount = 0
    public static var setUserAttributesCalled: Bool {
        return setUserAttributesCallsCount > 0
    }
    public static var setUserAttributesReceivedAttributes: [AnyHashable: Any]?
    public static var setUserAttributesReceivedInvocations: [[AnyHashable: Any]?] = []
    public static var setUserAttributesClosure: (([AnyHashable: Any]?) -> Void)?

    public static func setUserAttributes(_ attributes: [AnyHashable: Any]?) {
        setUserAttributesCallsCount += 1
        setUserAttributesReceivedAttributes = attributes
        setUserAttributesReceivedInvocations.append(attributes)
        setUserAttributesClosure?(attributes)
    }

}

// MARK: - TuneEventAdapter

public class TuneEventAdapterMock: TuneEventAdapter {

    public init() {}

    public var attribute1: String!

    public var attribute2: String!

    public var attribute3: String!

    public var attribute4: String!

    public var attribute5: String!

    // MARK: init?

    public var initNameReceivedName: String?
    public var initNameReceivedInvocations: [String?] = []
    public var initNameClosure: ((String?) -> Void)?

    public required init?(name: String!) {
        initNameReceivedName = name
        initNameReceivedInvocations.append(name)
        initNameClosure?(name)
    }
}

// MARK: - TuneServiceAdapter

public class TuneServiceAdapterMock: TuneServiceAdapter {

    public init() {}

    // MARK: mesure

    public static var mesureEventCallsCount = 0
    public static var mesureEventCalled: Bool {
        return mesureEventCallsCount > 0
    }
    public static var mesureEventReceivedEvent: Event?
    public static var mesureEventReceivedInvocations: [Event] = []
    public static var mesureEventClosure: ((Event) -> Void)?

    public static func mesure(event: Event) {
        mesureEventCallsCount += 1
        mesureEventReceivedEvent = event
        mesureEventReceivedInvocations.append(event)
        mesureEventClosure?(event)
    }

    // MARK: setAppAdTrackingEnabled

    public static var setAppAdTrackingEnabledCallsCount = 0
    public static var setAppAdTrackingEnabledCalled: Bool {
        return setAppAdTrackingEnabledCallsCount > 0
    }
    public static var setAppAdTrackingEnabledReceivedFlag: Bool?
    public static var setAppAdTrackingEnabledReceivedInvocations: [Bool] = []
    public static var setAppAdTrackingEnabledClosure: ((Bool) -> Void)?

    public static func setAppAdTrackingEnabled(_ flag: Bool) {
        setAppAdTrackingEnabledCallsCount += 1
        setAppAdTrackingEnabledReceivedFlag = flag
        setAppAdTrackingEnabledReceivedInvocations.append(flag)
        setAppAdTrackingEnabledClosure?(flag)
    }

    // MARK: setUserId

    public static var setUserIdCallsCount = 0
    public static var setUserIdCalled: Bool {
        return setUserIdCallsCount > 0
    }
    public static var setUserIdReceivedUserId: String?
    public static var setUserIdReceivedInvocations: [String?] = []
    public static var setUserIdClosure: ((String?) -> Void)?

    public static func setUserId(_ userId: String?) {
        setUserIdCallsCount += 1
        setUserIdReceivedUserId = userId
        setUserIdReceivedInvocations.append(userId)
        setUserIdClosure?(userId)
    }

}

// MARK: - UXCamServiceAdapter

public class UXCamServiceAdapterMock: UXCamServiceAdapter {

    public init() {}

    // MARK: logEvent

    public static var logEventWithPropertiesCallsCount = 0
    public static var logEventWithPropertiesCalled: Bool {
        return logEventWithPropertiesCallsCount > 0
    }
    public static var logEventWithPropertiesReceivedArguments: (eventName: String, withProperties: [String: Any]?)?
    public static var logEventWithPropertiesReceivedInvocations: [(eventName: String, withProperties: [String: Any]?)] = []
    public static var logEventWithPropertiesClosure: ((String, [String: Any]?) -> Void)?

    public static func logEvent(_ eventName: String, withProperties: [String: Any]?) {
        logEventWithPropertiesCallsCount += 1
        logEventWithPropertiesReceivedArguments = (eventName: eventName, withProperties: withProperties)
        logEventWithPropertiesReceivedInvocations.append((eventName: eventName, withProperties: withProperties))
        logEventWithPropertiesClosure?(eventName, withProperties)
    }

    // MARK: optInOverall

    public static var optInOverallCallsCount = 0
    public static var optInOverallCalled: Bool {
        return optInOverallCallsCount > 0
    }
    public static var optInOverallClosure: (() -> Void)?

    public static func optInOverall() {
        optInOverallCallsCount += 1
        optInOverallClosure?()
    }

    // MARK: optInOverallStatus

    public static var optInOverallStatusCallsCount = 0
    public static var optInOverallStatusCalled: Bool {
        return optInOverallStatusCallsCount > 0
    }
    public static var optInOverallStatusReturnValue: Bool!
    public static var optInOverallStatusClosure: (() -> Bool)?

    public static func optInOverallStatus() -> Bool {
        optInOverallStatusCallsCount += 1
        return optInOverallStatusClosure.map({ $0() }) ?? optInOverallStatusReturnValue
    }

    // MARK: optOutOverall

    public static var optOutOverallCallsCount = 0
    public static var optOutOverallCalled: Bool {
        return optOutOverallCallsCount > 0
    }
    public static var optOutOverallClosure: (() -> Void)?

    public static func optOutOverall() {
        optOutOverallCallsCount += 1
        optOutOverallClosure?()
    }

    // MARK: setUserIdentity

    public static var setUserIdentityCallsCount = 0
    public static var setUserIdentityCalled: Bool {
        return setUserIdentityCallsCount > 0
    }
    public static var setUserIdentityReceivedUserIdentity: String?
    public static var setUserIdentityReceivedInvocations: [String] = []
    public static var setUserIdentityClosure: ((String) -> Void)?

    public static func setUserIdentity(_ userIdentity: String) {
        setUserIdentityCallsCount += 1
        setUserIdentityReceivedUserIdentity = userIdentity
        setUserIdentityReceivedInvocations.append(userIdentity)
        setUserIdentityClosure?(userIdentity)
    }

    // MARK: setUserProperty

    public static var setUserPropertyValueCallsCount = 0
    public static var setUserPropertyValueCalled: Bool {
        return setUserPropertyValueCallsCount > 0
    }
    public static var setUserPropertyValueReceivedArguments: (propertyName: String, value: Any)?
    public static var setUserPropertyValueReceivedInvocations: [(propertyName: String, value: Any)] = []
    public static var setUserPropertyValueClosure: ((String, Any) -> Void)?

    public static func setUserProperty(_ propertyName: String, value: Any) {
        setUserPropertyValueCallsCount += 1
        setUserPropertyValueReceivedArguments = (propertyName: propertyName, value: value)
        setUserPropertyValueReceivedInvocations.append((propertyName: propertyName, value: value))
        setUserPropertyValueClosure?(propertyName, value)
    }

    // MARK: tagScreenName

    public static var tagScreenNameCallsCount = 0
    public static var tagScreenNameCalled: Bool {
        return tagScreenNameCallsCount > 0
    }
    public static var tagScreenNameReceivedScreenName: String?
    public static var tagScreenNameReceivedInvocations: [String] = []
    public static var tagScreenNameClosure: ((String) -> Void)?

    public static func tagScreenName(_ screenName: String) {
        tagScreenNameCallsCount += 1
        tagScreenNameReceivedScreenName = screenName
        tagScreenNameReceivedInvocations.append(screenName)
        tagScreenNameClosure?(screenName)
    }

}
