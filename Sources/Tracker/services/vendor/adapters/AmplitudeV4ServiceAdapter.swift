import Foundation

/**
 Links:
 - https://help.amplitude.com/hc/en-us/articles/115002278527#tracking-events

 Pod sample: `pod 'Amplitude-iOS', '~> 4.10.0'`

 Integration sample:
 ```
 import class Amplitude_iOS.Amplitude
 import Tracker

 extension Amplitude_iOS.Amplitude: AmplitudeV4ServiceAdapter {}
 ```
 */

public protocol AmplitudeV4ServiceAdapter: AmplitudeServiceAdapter, _AmplitudeV4ServiceAdapter {}

public protocol _AmplitudeV4ServiceAdapter: AnyObject {
    var optOut: Bool { get set }
    
    func clearUserProperties()
    func logEvent(_ eventType: String!, withEventProperties: [AnyHashable: Any]!)
    func regenerateDeviceId()
    func setUserId(_ id: String!)
    func setUserProperties(_ dictionary: [AnyHashable: Any]!)
}

extension AmplitudeV4ServiceAdapter {
    func logEvent(_ eventType: String, withEventProperties: [AnyHashable: Any]?) {
        (self as _AmplitudeV4ServiceAdapter).logEvent(eventType, withEventProperties: withEventProperties)
    }

    func setUserId(_ id: String?) {
        (self as _AmplitudeV4ServiceAdapter).setUserId(id)
    }

    func setUserProperties(_ dictionary: [AnyHashable: Any]) {
        (self as _AmplitudeV4ServiceAdapter).setUserProperties(dictionary)
    }
}
