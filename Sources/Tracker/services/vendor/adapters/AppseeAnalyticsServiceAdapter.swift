import Foundation

/**
 Links:
 - https://www.appsee.com/docs/ios/api

 Pod sample: `pod 'AppseeAnalytics'`

 Integration sample:
 ```
 import class AppseeAnalytics.AppseeAnalytics
 import Tracker

 extension AppseeAnalytics: AppseeAnalyticsServiceAdapter {}
 ```
 */

public protocol AppseeAnalyticsServiceAdapter {
    static func addEvent(_ eventName: String!, withProperties properties: [AnyHashable: Any]!)
    static func addScreenAction(_ actionName: String!)
    static func deleteCurrentUserData() -> Bool
    static func getOptOutStatus() -> Bool
    static func setOptOutStatus(_ flag: Bool)
    static func setUserID(_ userID: String!)
    static func startScreen(_ screenName: String!)
}
