import Foundation

/**
 Links:
 - https://tune.docs.branch.io/sdk/event-builder/#code-platform-ios
 - https://tune.docs.branch.io/sdk/measuring-in-app-events/

 Pod sample: `pod 'Tune'`

 Integration sample:
 ```
 import class Tune.Tune
 import class Tune.TuneEvent
 import Tune
 
 extension TuneEvent: TuneEventAdapter {}

 extension Tune: TuneServiceAdapter {
     public static func mesure(event: Event) {
         guard let tuneEvent: TuneEvent = event.toTuneEvent() else {
             return
         }
         Self.measure(tuneEvent)
     }
 }
 ```
 */

public protocol TuneServiceAdapter {
    static func mesure(event: Event)
    static func setAppAdTrackingEnabled(_ flag: Bool)
    static func setUserId(_ userId: String?)
}

public protocol TuneEventAdapter {
    init?(name: String!)
    var attribute1: String! { get set }
    var attribute2: String! { get set }
    var attribute3: String! { get set }
    var attribute4: String! { get set }
    var attribute5: String! { get set }
}

extension Event {
    public func toTuneEvent<T: TuneEventAdapter>() -> T? {
        guard var event = T.init(name: name) else {
            assertionFailure("Event not tracked: \(name)")
            return nil
        }
        let attributes = parameters
            .reduce(into: [String]()) { $0 += ["\($1.key) = \($1.value)"] }
        for (index, value) in attributes.enumerated() {
            switch index {
            case 0: event.attribute1 = value
            case 1: event.attribute2 = value
            case 2: event.attribute3 = value
            case 3: event.attribute4 = value
            case 4: event.attribute5 = value
            default:
                assertionFailure("Too many attributes: \(attributes.count)")
            }
        }
        return event
    }
}
