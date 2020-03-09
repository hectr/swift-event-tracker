import Foundation

extension Service where Self: AbstractProvider {
    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        let event = NamedEvent("Set property") + [key: value]
        trackEvent(event)
    }

    public func resetProperties() {
        let event = NamedEvent("Reset properties") + ["keys": userProperties.keys.joined(separator: ", ")]
        userProperties = [:]
        trackEvent(event)
    }
}
