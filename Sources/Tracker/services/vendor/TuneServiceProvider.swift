import Foundation

public final class TuneServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.tune, .analytics]

    private let adapter: TuneServiceAdapter.Type

    public init(adapter: TuneServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.mesure(event: event)
    }

    public func setUserId(_ userId: String) {
        adapter.setUserId(userId)
    }

    public func resetUserId() {
        adapter.setUserId(nil)
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        adapter.setAppAdTrackingEnabled(!flag)
    }
}
