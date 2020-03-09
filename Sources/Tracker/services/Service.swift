import Foundation

public protocol Service {
    var supportedTags: [Tag] { get }

    var trackingDisabled: Bool { get }

    func trackEvent(_ event: Event)

    func setUserId(_ userId: String)
    func resetUserId()
    
    func setProperty(_ key: String, value: String)
    func resetProperties()

    func trackScreen(_ screen: Screen)

    func disableTracking(_ flag: Bool)
}
