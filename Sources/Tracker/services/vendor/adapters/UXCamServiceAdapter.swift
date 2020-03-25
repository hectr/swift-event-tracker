import Foundation

/**
 Links:
 - https://help.uxcam.com/hc/en-us/categories/115000129131-Developer-Guide

 Pod sample: `pod 'UXCam'`

 Integration sample:
 ```
 import Tracker
 import class UXCam.UXCam

 extension UXCam: UXCamServiceAdapter {}
 ```
 */

public protocol UXCamServiceAdapter {
    static func logEvent(_ eventName: String, withProperties: [String: Any]?)
    static func optInOverall()
    static func optInOverallStatus() -> Bool
    static func optOutOverall()
    static func setUserIdentity(_ userIdentity: String)
    static func setUserProperty(_ propertyName: String, value: Any)
    static func tagScreenName(_ screenName: String)
}
