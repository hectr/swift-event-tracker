import Foundation

/**
 Links:
 - https://github.com/taplytics/taplytics-ios-sdk/blob/master/START.md

 Pod sample: `pod 'Taplytics'`

 Integration sample:
 ```
 import class Taplytics.Taplytics
 import Tracker

 extension Taplytics: TaplyticsServiceAdapter {}
 ```
 */

public protocol TaplyticsServiceAdapter {
    static func hasUserOptedOutTracking() -> Bool
    static func logEvent(_ eventName: String)
    static func optOutUserTracking()
    static func optInUserTracking()
    static func setUserAttributes(_ attributes: [AnyHashable: Any]?)
}
