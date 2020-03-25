import Foundation

/**
 Links:
 - https://help.amplitude.com/hc/en-us/articles/115002278527#tracking-events

 Pod sample: `pod 'Amplitude-iOS'`

 Integration sample:
 ```
 import class Amplitude_iOS.Amplitude
 import Tracker

 extension Amplitude_iOS.Amplitude: AmplitudeServiceAdapter {}
 ```
 */

public protocol AmplitudeServiceAdapter: AnyObject {
    var optOut: Bool { get set }
    
    func clearUserProperties()
    func logEvent(_ eventType: String!, withEventProperties: [AnyHashable: Any]!)
    func regenerateDeviceId()
    func setUserId(_ id: String!)
    func setUserProperties(_ dictionary: [AnyHashable: Any]!)
}
