import Foundation

/**
 Links:
 - https://docs.microsoft.com/en-us/appcenter/sdk/analytics/ios
 - https://docs.microsoft.com/en-us/appcenter/sdk/getting-started/ios

 Pod sample: `pod 'AppCenter/Analytics'`

 Integration sample:
 ```
 import class AppCenterAnalytics.MSAnalytics
 import Tracker

 extension AppCenterAnalytics.MSAnalytics: AppCenterAnalyticsServiceAdapter {}
 ```
 */

public protocol AppCenterAnalyticsServiceAdapter {
    static func pause()
    static func resume()
    static func trackEvent(_ eventName: String, withProperties properties: [String: String]?)
}
