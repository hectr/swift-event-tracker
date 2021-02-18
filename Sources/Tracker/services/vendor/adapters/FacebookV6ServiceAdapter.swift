import Foundation

/**
 Links:
 - https://developers.facebook.com/docs/app-events/getting-started-app-events-ios
 - https://developers.facebook.com/docs/analytics/quickstart-list/ios/
 
 Pod sample: `pod 'FacebookSDK', '~> 6.5.2'`
 Package sample: `.package(url: "https://github.com/facebook/facebook-ios-sdk.git", from: "6.5.2"),`

 Integration sample:
 ```
 import class FBSDKCoreKit.AppEvents
 import class FBSDKCoreKit.Settings
 import Tracker

 extension FBSDKCoreKit.AppEvents: FacebookV6ServiceAdapter {
     public static func logEvent(_ eventName: String, parameters: [String: Any]) {
         logEvent(Self.Name(rawValue: eventName), parameters: parameters)
     }

     public static func updateUserProperties(_ properties: [String: Any]) {
         updateUserProperties(properties, handler: nil)
     }
 }

 extension FBSDKCoreKit.Settings: FacebookV6SettingsAdapter {}
 ```
 */

public protocol FacebookV6ServiceAdapter: FacebookServiceAdapter {
    static var userID: String? { get set }

    static func clearUserID()
    static func logEvent(_ eventName: String, parameters: [String : Any])
    static func updateUserProperties(_ properties: [String: Any])

}

public protocol FacebookV6SettingsAdapter: FacebookSettingsAdapter {
    static var isAutoLogAppEventsEnabled: Bool { get set }
}
