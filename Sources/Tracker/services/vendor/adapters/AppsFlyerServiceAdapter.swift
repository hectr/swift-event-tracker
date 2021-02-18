import Foundation

/**
Links:
- https://support.appsflyer.com/hc/en-us/articles/207032066-iOS-SDK-integration-for-developers#core-apis

 Pod sample: `pod 'AppsFlyerFramework', '~> 6.2.2'`
 Package sample: `.package(url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework.git", from: "6.2.2"),`

 Integration sample:
 ```
 import class AppsFlyerLib.AppsFlyerLib
 import Tracker

 extension AppsFlyerLib: AppsFlyerServiceAdapter {}
 ```
*/

public protocol AppsFlyerServiceAdapter: AnyObject {
    var customData: [AnyHashable: Any]? { get set }
    var customerUserID: String? { get set }
    var isStopped: Bool { get set }

    func logEvent(_ eventName: String, withValues: [AnyHashable: Any]?)
}
