import Foundation

/**
 Links:
 - https://docs.instabug.com/docs/ios-set-custom-data

 Pod sample: `pod 'Instabug'`

 Integration sample:
 ```
 import class Instabug.Instabug
 import Tracker

 extension Instabug: InstabugServiceAdapter {}
 ```
 */

public protocol InstabugServiceAdapter {
    static func logUserEvent(withName: String)
    static func removeUserAttribute(forKey: String)
    static func setUserAttribute(_ value: String, withKey: String)
}
