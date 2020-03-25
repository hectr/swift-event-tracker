import Foundation

public final class AmplitudeServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.amplitude, .analytics]
    public override var trackingDisabled: Bool { adapter.optOut }

    private let adapter: AmplitudeServiceAdapter

    public init(adapter: AmplitudeServiceAdapter) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.logEvent(event.name, withEventProperties: event.parameters)
    }

    public func setUserId(_ userId: String) {
        adapter.setUserId(userId)
    }

    public func resetUserId() {
        adapter.setUserId(nil)
        adapter.regenerateDeviceId()
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        adapter.setUserProperties(userProperties)
    }

    public func resetProperties() {
        userProperties = [:]
        adapter.clearUserProperties()
    }

    public override func disableTracking(_ flag: Bool) {
        adapter.optOut = flag
    }
}
