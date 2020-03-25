import Foundation

public final class TaplyticsServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.taplytics, .analytics]

    public override var trackingDisabled: Bool { adapter.hasUserOptedOutTracking() }

    private let adapter: TaplyticsServiceAdapter.Type
    private var userId: String?

    public init(adapter: TaplyticsServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.logEvent(event.name)
        for (key, value) in event.parameters {
            userProperties[event.name + " -> " + key] = value
        }
        setUserAttributes()
    }

    public func setUserId(_ userId: String) {
        self.userId = userId
        setUserAttributes()
    }

    public func resetUserId() {
        userId = nil
        setUserAttributes()
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        setUserAttributes()
    }

    public func resetProperties() {
        userProperties = [:]
        setUserAttributes()
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        if flag {
            adapter.optOutUserTracking()
        } else {
            adapter.optInUserTracking()
        }
    }

    private func setUserAttributes() {
        var userAttributes = [AnyHashable: Any]()
        userAttributes["user_id"] = userId
        userAttributes["customData"] = userProperties
        adapter.setUserAttributes(userAttributes)
    }
}
