import Foundation

/**
 Links:
 - https://developer.mixpanel.com/docs/swift
 - https://github.com/mixpanel/mixpanel-iphone

 Pod sample: `pod 'Mixpanel-swift'`

 Integration sample:
 ```
 import Mixpanel
 import Tracker

 extension MixpanelInstance: MixpanelServiceAdapter {
     public func optInTracking(distinctId: String?, properties: [String: Any]?) {
         optInTracking(distinctId: distinctId, properties: dictionaryToProperties(properties))
     }

     public func set(property: String, to value: String) {
         people.set(property: property, to: value)
     }

     public func unset(properties: [String]) {
         people.unset(properties: properties)
     }

     public func track(event: String?, properties: [String: Any]?) {
         track(event: event, properties: dictionaryToProperties(properties))
     }

     private func dictionaryToProperties(_ dictionary: [String: Any]?) -> Properties? {
         guard let dictionary = dictionary else {
             return nil
         }
         return dictionaryToProperties(dictionary)
     }

     private func dictionaryToProperties(_ dictionary: [String: Any]) -> Properties {
         dictionary.reduce(into: [String: MixpanelType]()) { $0[$1.key] = $1.value as? MixpanelType }
     }
 }
 ```
 */

public protocol MixpanelServiceAdapter: AnyObject {
    var userId: String? { get set }

    func hasOptedOutTracking() -> Bool
    func optInTracking(distinctId: String?, properties: [String: Any]?)
    func optOutTracking()
    func set(property: String, to value: String)
    func track(event: String?, properties: [String: Any]?)
    func unset(properties: [String])
}
