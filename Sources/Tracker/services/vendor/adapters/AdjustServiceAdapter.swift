import Foundation

/**
 Links:
 - https://github.com/adjust/ios_sdk#event-tracking

 Pod sample: `pod 'Adjust'`

 Integration sample:
 ```
 import class Adjust.Adjust
 import class Adjust.ADJEvent
 import Tracker

 extension Adjust: AdjustServiceAdapter {
     public static func trackEvent(_ eventName: String, parameters: [String: String]) {
         guard let event = ADJEvent(eventToken: eventName) else {
             return
         }
         event.setValuesForKeys(parameters)
         Adjust.trackEvent(event)
     }
 }
 ```
 */

public protocol AdjustServiceAdapter {
    static func trackEvent(_ eventName: String, parameters: [String: String])
    static func setEnabled(_ flag: Bool)
}
