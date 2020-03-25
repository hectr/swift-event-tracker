import Foundation

public final class InstabugServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.instabug, .crashReporting]

    private let adapter: InstabugServiceAdapter.Type

    public init(adapter: InstabugServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.logUserEvent(withName: event.name)
        for (key, value) in event.parameters {
            adapter.setUserAttribute(value, withKey: event.name + " -> " + key)
        }
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        adapter.setUserAttribute(value, withKey: key)
    }

    public func resetProperties() {
        userProperties.keys.forEach { adapter.removeUserAttribute(forKey: $0) }
        userProperties = [:]
    }
}
