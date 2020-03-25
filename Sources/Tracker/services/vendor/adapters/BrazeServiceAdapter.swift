import Foundation

/**
Links:
- https://www.braze.com/docs/developer_guide/platform_integration_guides/ios/analytics/tracking_custom_events/

 Pod sample: `pod 'Appboy-iOS-SDK'`

 Integration sample:
 ```
 import class Appboy_iOS_SDK.Appboy
 import Tracker

 import Appboy_iOS_SDK

 extension Appboy_iOS_SDK.Appboy: BrazeServiceAdapter {
     public func setCustomAttributeWithKey(_ key: String, andStringValue value: String) {
         Appboy.sharedInstance()?.user.setCustomAttributeWithKey(key, andStringValue: value)
     }

     public func unsetCustomAttributeWithKey(_ key: String) {
         Appboy.sharedInstance()?.user.unsetCustomAttribute(withKey: key)
     }
 }
 ```
*/

public protocol BrazeServiceAdapter: AnyObject {
    func changeUser(_ userId: String)
    func logCustomEvent(_ eventName: String, withProperties: [AnyHashable: Any]?)
    func setCustomAttributeWithKey(_ key: String, andStringValue value: String)
    func unsetCustomAttributeWithKey(_ key: String)
}
