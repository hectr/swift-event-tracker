import Foundation

public final class FirebaseAnalyticsServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.firebaseAnalytics, .analytics]

    private let adapter: FirebaseAnalyticsServiceAdapter.Type

    public init(adapter: FirebaseAnalyticsServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.logEvent(event.name, parameters: event.parameters)
    }

    public func trackScreen(_ screen: Screen) {
        if let screen = screen as? FirebaseAnalyticsScreen {
            adapter.setScreenName(screen.name, screenClass: screen.screenClass)
        } else {
            adapter.setScreenName(screen.name, screenClass: nil)
        }
    }

    public func setUserId(_ userId: String) {
        adapter.setUserID(userId)
    }

    public func resetUserId() {
        adapter.setUserID(nil)
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        adapter.setUserProperty(value, forName: key)
    }

    public func resetProperties() {
        userProperties.keys.forEach { adapter.setUserProperty(nil, forName: $0) }
        userProperties = [:]
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        adapter.setAnalyticsCollectionEnabled(!flag)
    }
}
