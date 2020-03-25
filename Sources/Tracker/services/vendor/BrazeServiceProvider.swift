import Foundation

public final class BrazeServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.braze, .analytics]

    private let adapter: BrazeServiceAdapter

    public init(adapter: BrazeServiceAdapter) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.logCustomEvent(event.name, withProperties: event.parameters)
    }

    public func setUserId(_ userId: String) {
        adapter.changeUser(userId)
    }

    public func resetUserId() {
        adapter.changeUser("")
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        adapter.setCustomAttributeWithKey(key, andStringValue: value)
    }

    public func resetProperties() {
        userProperties.keys.forEach { adapter.unsetCustomAttributeWithKey($0) }
        userProperties = [:]
    }
}
