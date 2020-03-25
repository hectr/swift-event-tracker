import Foundation

/**
 Links:
 - https://docs.bugsee.com/sdk/ios/custom/

 Pod sample: `pod 'Bugsee'`

 Integration sample:
 ```
 import class Bugsee.Bugsee
 import Tracker

 extension Bugsee: BugseeServiceAdapter {}
 ```
 */

public protocol BugseeServiceAdapter {
    static func clearAllAttribute() -> Bool
    static func event(_ eventName: String, params: [AnyHashable: Any])
    static func pause()
    static func resume()
    static func setAttribute(_ key: String, value: Any) -> Bool
}
