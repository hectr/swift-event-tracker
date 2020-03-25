import Foundation

public final class CountlyServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.countly, .analytics]

    private let adapter: CountlyServiceAdapter
    private let userAdapter: CountlyUserDetailsAdapter

    public init(adapter: CountlyServiceAdapter, userAdapter: CountlyUserDetailsAdapter) {
        self.adapter = adapter
        self.userAdapter = userAdapter
    }

    public func trackEvent(_ event: Event) {
        adapter.recordEvent(event.name, segmentation: event.parameters)
    }

    public func trackScreen(_ screen: Screen) {
        if let screen = screen as? CountlyScreen {
            adapter.recordView(screen.name, segmentation: screen.segmentation)
        } else {
            adapter.recordView(screen.name)
        }
    }

    public func setUserId(_ userId: String) {
        adapter.userLogged(in: userId)
    }

    public func resetUserId() {
        adapter.userLoggedOut()
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        userAdapter.set(key, value: value)
    }

    public func resetProperties() {
        userProperties.keys.forEach { userAdapter.unSet($0) }
        userProperties = [:]
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        if flag {
            adapter.cancelConsentForAllFeatures()
        } else {
            adapter.giveConsentForAllFeatures()
        }
    }
}
