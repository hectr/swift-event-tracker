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
        userProperties[key] = value
        adapter.updateUserProperties(userProperties)
    }

    public func resetProperties() {
        userProperties = [:]
        adapter.updateUserProperties(userProperties)
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        settingsAdapter.isAutoLogAppEventsEnabled = flag
    }
}
