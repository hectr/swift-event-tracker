import Foundation

public final class AdjustServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.adjust, .analytics]

    private let adapter: AdjustServiceAdapter.Type

    public init(adapter: AdjustServiceAdapter.Type) {
        self.adapter = adapter
    }

    public func trackEvent(_ event: Event) {
        adapter.trackEvent(event.name, parameters: event.parameters)
    }

    public override func disableTracking(_ flag: Bool) {
        super.disableTracking(flag)
        adapter.setEnabled(!flag)
    }
}
