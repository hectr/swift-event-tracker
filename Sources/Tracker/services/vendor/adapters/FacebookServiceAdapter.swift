import Foundation

/**
 Links:
 - https://developers.facebook.com/docs/app-events/getting-started-app-events-ios
 - https://developers.facebook.com/docs/analytics/quickstart-list/ios/
 
 Pod sample: `pod 'FacebookSDK', '~> 9.0.1'`
 Package sample: `.package(url: "https://github.com/facebook/facebook-ios-sdk.git", from: "9.0.1"),`

 Integration sample:
 ```
 import class FacebookCore.AppEvents
 import class FacebookCore.Settings
 import Tracker

 extension FacebookCore.AppEvents: FacebookServiceAdapter {
     public static func logEvent(_ eventName: String, parameters: [String: Any]) {
         logEvent(Self.Name(rawValue: eventName), parameters: parameters)
     }

     public static func updateUserProperties(_ properties: [String: Any]) {
         updateUserProperties(properties, handler: nil)
     }
 }

 extension FacebookCore.Settings: FacebookSettingsAdapter {}
 ```
 */

public protocol FacebookServiceAdapter {
    static var userID: String? { get set }

    static func clearUserID()
    static func logEvent(_ eventName: String, parameters: [String : Any])
}

public protocol FacebookSettingsAdapter {
    static var isAutoLogAppEventsEnabled: Bool { get set }
}
