import Foundation

/**
 Links:
 - https://help.amplitude.com/hc/en-us/articles/115002278527#tracking-events

 Pod sample: `pod 'Amplitude', '~> 7.2.2'`
 Package sample: `.package(url: "https://github.com/amplitude/Amplitude-iOS.git", from: "7.2.2"),`

 Integration sample:
 ```
 import class Amplitude.Amplitude
 import Tracker

 extension Amplitude.Amplitude: AmplitudeServiceAdapter {}
 ```
 */

public protocol AmplitudeServiceAdapter: AnyObject {
    var optOut: Bool { get set }
    
    func clearUserProperties()
    func logEvent(_ eventType: String, withEventProperties: [AnyHashable: Any]?)
    func regenerateDeviceId()
    func setUserId(_ id: String?)
    func setUserProperties(_ dictionary: [AnyHashable: Any])
}
