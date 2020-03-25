import Foundation

/**
 Links:
 - https://firebase.google.com/docs/crashlytics/upgrade-sdk
 
 Pod sample: `pod 'Firebase/Crashlytics'`

 Integration sample:
 ```
 import class FirebaseCrashlytics.Crashlytics
 import Tracker

 extension FirebaseCrashlytics.Crashlytics: CrashlyticsServiceAdapter {}
 ```
 */

public protocol CrashlyticsServiceAdapter: AnyObject {
    func deleteUnsentReports()
    func log(_ msg: String)
    func record(error: Swift.Error)
    func setCrashlyticsCollectionEnabled(_ flag: Bool)
    func isCrashlyticsCollectionEnabled() -> Bool
    func setCustomValue(_ value: Any, forKey: String)
    func setUserID(_ userId: String)
}
