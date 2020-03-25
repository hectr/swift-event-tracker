import Foundation

public final class AppseeAnalyticsServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.appseeAnalytics, .analytics]
    public override var trackingDisabled: Bool { !adapter.getOptOutStatus() }

    private let adapter: AppseeAnalyticsServiceAdapter.Type
    private var currentScreen: String?

    public init(adapter: AppseeAnalyticsServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.addEvent(event.name, withProperties: event.parameters)
    }

    public func trackScreen(_ screen: Screen) {
        if let screen = screen as? AppseeAnalyticsScreen {
            if screen.name != currentScreen {
                adapter.startScreen(screen.name)
                currentScreen = screen.name
            }
            for action in screen.actions {
                adapter.addScreenAction(action)
            }
        } else {
            adapter.startScreen(screen.name)
        }
    }

    public func setUserId(_ userId: String) {
        adapter.setUserID(userId)
    }

    public func resetUserId() {
        adapter.setUserID(nil)
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        if flag {
            _ = adapter.deleteCurrentUserData()
        }
        adapter.setOptOutStatus(flag)
    }
}
