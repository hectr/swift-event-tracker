import Foundation

/**
 Links:
 - https://support.count.ly/hc/en-us/articles/360037753511-iOS-watchOS-tvOS-macOS

 Pod sample: `pod 'Countly'`

 Integration sample:
 ```
 import class Countly.Countly
 import class Countly.CountlyUserDetails
 import Tracker

 extension Countly: CountlyServiceAdapter {}

 extension CountlyUserDetails: CountlyUserDetailsAdapter {}
 ```
*/

public protocol CountlyServiceAdapter {
    func recordEvent(_ eventName: String, segmentation: [String: String]?)
    func recordView(_ view: String)
    func recordView(_ view: String, segmentation: [String: String])
    func userLogged(in userID: String)
    func userLoggedOut()
    func giveConsentForAllFeatures()
    func cancelConsentForAllFeatures()
}

public protocol CountlyUserDetailsAdapter {
    func set(_ key: String, value: String)
    func unSet(_ key: String)
}
