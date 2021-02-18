import Foundation

/**
Links:
- https://support.appsflyer.com/hc/en-us/articles/207032066-iOS-SDK-integration-for-developers#core-apis

 Pod sample: `pod 'AppsFlyerFramework', '~> 5.4.4'`

 Integration sample:
 ```
 import class AppsFlyerLib.AppsFlyerTracker
 import Tracker

 extension AppsFlyerLib.AppsFlyerTracker: AppsFlyerV5ServiceAdapter {}
 ```
*/

public protocol _AppsFlyerV5ServiceAdapter: AnyObject {
    var customData: [AnyHashable: Any]? { get set }
    var customerUserID: String? { get set }
    var isStopTracking: Bool { get set }

    func trackEvent(_ eventName: String, withValues: [AnyHashable: Any]?)
}

public protocol AppsFlyerVServiceAdapter: AppsFlyerServiceAdapter, _AppsFlyerV5ServiceAdapter {}

extension AppsFlyerVServiceAdapter {
    var isStopped: Bool {
        get { isStopTracking }
        set { isStopTracking = newValue }
    }

    func logEvent(_ eventName: String, withValues: [AnyHashable : Any]?) {
        trackEvent(eventName, withValues: withValues)
    }
}
