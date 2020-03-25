import Foundation

/**
Links:
- https://support.appsflyer.com/hc/en-us/articles/207032066-iOS-SDK-integration-for-developers#core-apis

 Pod sample: `pod 'AppsFlyerFramework'`

 Integration sample:
 ```
 import class AppsFlyerLib.AppsFlyerTracker
 import Tracker

 extension AppsFlyerLib.AppsFlyerTracker: AppsFlyerServiceAdapter {}
 ```
*/

public protocol AppsFlyerServiceAdapter: AnyObject {
    var customData: [AnyHashable: Any]? { get set }
    var customerUserID: String? { get set }
    var isStopTracking: Bool { get set }

    func trackEvent(_ eventName: String, withValues: [AnyHashable: Any]?)
}
