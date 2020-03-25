import Foundation

public final class BugseeServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.bugsee, .crashReporting]

    private let adapter: BugseeServiceAdapter.Type

    public init(adapter: BugseeServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.event(event.name, params: event.parameters)
    }

    public func setProperty(_ key: String, value: String) {
        _ = adapter.setAttribute(key, value: value)
    }

    public func resetProperties() {
        _ = adapter.clearAllAttribute()
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        if flag {
            adapter.pause()
        } else {
            adapter.resume()
        }
    }
}
