import Foundation

public final class FlurryServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.flurry, .analytics]

    private let adapter: FlurryServiceAdapter.Type

    public init(adapter: FlurryServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.log(eventName: event.name, withParameters: event.parameters)
    }

    public func setUserId(_ userId: String) {
        adapter.setUserID(userId)
    }

    public func resetUserId() {
        adapter.setUserID(nil)
    }

    public func setProperty(_ key: String, value: String) {
        userProperties[key] = value
        adapter.sessionProperties(userProperties)
    }

    public func resetProperties() {
        userProperties = [:]
        adapter.sessionProperties(userProperties)
    }
}
