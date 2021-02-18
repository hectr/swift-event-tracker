import Foundation

public final class FacebookServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.facebook, .analytics]

    private let adapter: FacebookServiceAdapter.Type
    private let settingsAdapter: FacebookSettingsAdapter.Type

    public init(adapter: FacebookServiceAdapter.Type, settingsAdapter: FacebookSettingsAdapter.Type) {
        self.adapter = adapter
        self.settingsAdapter = settingsAdapter
    }

    public func trackEvent(_ event: Event) {
        adapter.logEvent(event.name, parameters: event.parameters)
    }

    public func setUserId(_ userId: String) {
        adapter.userID = userId
    }

    public func resetUserId() {
        adapter.userID = nil
    }

    public func setProperty(_ key: String, value: String) {
        if let adapter = adapter as? FacebookV6ServiceAdapter.Type {
            userProperties[key] = value
            adapter.updateUserProperties(userProperties)
        } else {
            userProperties[key] = value
            let event = NamedEvent("Set property") + [key: value]
            trackEvent(event)
        }
    }

    public func resetProperties() {
        if let adapter = adapter as? FacebookV6ServiceAdapter.Type {
            userProperties = [:]
            adapter.updateUserProperties(userProperties)
        } else {
            let event = NamedEvent("Reset properties") + ["keys": userProperties.keys.joined(separator: ", ")]
            userProperties = [:]
            trackEvent(event)
        }
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        settingsAdapter.isAutoLogAppEventsEnabled = flag
    }
}
