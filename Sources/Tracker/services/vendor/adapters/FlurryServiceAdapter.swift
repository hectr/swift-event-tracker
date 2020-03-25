import Foundation

/**
 Links:
 - https://github.com/flurry/flurry-ios-sdk

 Pod sample: `pod 'Flurry-iOS-SDK/FlurrySDK'`

 Integration sample:
 ```
 import class Flurry_iOS_SDK.Flurry
 import Tracker

 extension Flurry_iOS_SDK.Flurry: FlurryServiceAdapter {
     public static func log(eventName: String, withParameters parameters: [AnyHashable: Any]?) {
         _ = logEvent(eventName, withParameters: parameters)
     }
 }
 ```
 */

public protocol FlurryServiceAdapter {
    static func log(eventName: String, withParameters parameters: [AnyHashable: Any]?)
    static func sessionProperties(_ properties: [AnyHashable: Any])
    static func setUserID(_ userID: String?)
}
