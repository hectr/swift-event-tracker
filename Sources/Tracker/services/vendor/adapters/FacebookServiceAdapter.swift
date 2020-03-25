import Foundation

/**
 Links:
 - https://developers.facebook.com/docs/app-events/getting-started-app-events-ios
 - https://developers.facebook.com/docs/analytics/quickstart-list/ios/
 
 Pod sample: `pod 'FacebookSDK'`

 Integration sample:
 ```
 import class FBSDKCoreKit.AppEvents
 import class FBSDKCoreKit.Settings
 import Tracker

 extension FBSDKCoreKit.AppEvents: FacebookServiceAdapter {
     public static func logEvent(_ eventName: String, parameters: [String: Any]) {
         logEvent(Self.Name(rawValue: eventName), parameters: parameters)
     }

     public static func updateUserProperties(_ properties: [String: Any]) {
         updateUserProperties(properties, handler: nil)
     }
 }

 extension FBSDKCoreKit.Settings: FacebookSettingsAdapter {}
 ```
 */

public protocol FacebookServiceAdapter {
    static var userID: String? { get set }

    static func clearUserID()
    static func logEvent(_ eventName: String, parameters: [String : Any])
    static func updateUserProperties(_ properties: [String: Any])

}

public protocol FacebookSettingsAdapter {
    static var isAutoLogAppEventsEnabled: Bool { get set }
}
