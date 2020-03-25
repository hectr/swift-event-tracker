import Foundation

/**
 Links:
 - https://firebase.google.com/docs/analytics/get-started?platform=ios

 Pod sample: `pod 'Firebase/Analytics'`

 Integration sample:
 ```
 import class FirebaseAnalytics.Analytics
 import Tracker

 extension FirebaseAnalytics.Analytics: FirebaseAnalyticsServiceAdapter {}
 ```
 */

public protocol FirebaseAnalyticsServiceAdapter {
    // swiftlint:disable:next discouraged_optional_collection
    static func logEvent(_ name: String, parameters: [String: Any]?)
    static func setAnalyticsCollectionEnabled(_ enabled: Bool)
    static func setScreenName(_ name: String?, screenClass: String?)
    static func setUserID(_ userId: String?)
    static func setUserProperty(_ value: String?, forName: String)
}
