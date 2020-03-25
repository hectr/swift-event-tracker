import Foundation

public final class CrashlyticsServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.crashlytics, .crashReporting]
    public override var trackingDisabled: Bool { !adapter.isCrashlyticsCollectionEnabled() }

    private let adapter: CrashlyticsServiceAdapter

    public init(adapter: CrashlyticsServiceAdapter) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.log(event.name)
        for (key, value) in event.parameters {
            adapter.setCustomValue(value, forKey: event.name + " -> " + key)
        }
    }

    public func setUserId(_ userId: String) {
        adapter.setUserID(userId)
    }

    public func resetUserId() {
        adapter.setUserID("")
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        adapter.setCustomValue(value, forKey: key)
    }

    public func resetProperties() {
        userProperties.keys.forEach { adapter.setCustomValue("", forKey: $0) }
        userProperties = [:]
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        adapter.setCrashlyticsCollectionEnabled(!flag)
        adapter.deleteUnsentReports()
    }
}
