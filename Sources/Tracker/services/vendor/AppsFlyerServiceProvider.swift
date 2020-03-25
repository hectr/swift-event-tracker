import Foundation

public final class AppsFlyerServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.appsFlyer, .analytics]
    public override var trackingDisabled: Bool { adapter.isStopTracking }

    private let adapter: AppsFlyerServiceAdapter

    public init(adapter: AppsFlyerServiceAdapter) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.trackEvent(event.name, withValues: event.parameters)
    }

    public func setUserId(_ userId: String) {
        adapter.customerUserID = userId
    }

    public func resetUserId() {
        adapter.customerUserID = nil
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        adapter.customData = userProperties
    }

    public func resetProperties() {
        userProperties = [:]
        adapter.customData = userProperties
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        adapter.isStopTracking = flag
    }
}
