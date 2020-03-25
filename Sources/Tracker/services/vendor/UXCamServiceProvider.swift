import Foundation

public final class UXCamServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.uxCam, .analytics]

    public override var trackingDisabled: Bool { !adapter.optInOverallStatus() }

    private let adapter: UXCamServiceAdapter.Type

    public init(adapter: UXCamServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.logEvent(event.name, withProperties: event.parameters)
    }

    public func setUserId(_ userId: String) {
        adapter.setUserIdentity(userId)
    }

    public func resetUserId() {
        adapter.setUserIdentity("")
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        adapter.setUserProperty(key, value: value)
    }

    public func resetProperties() {
        userProperties.keys.forEach { adapter.setUserProperty($0, value: "") }
        userProperties = [:]
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        if flag {
            adapter.optOutOverall()
        } else {
            adapter.optInOverall()
        }
    }
}
