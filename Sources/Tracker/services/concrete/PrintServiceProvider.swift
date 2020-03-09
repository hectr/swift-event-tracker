import Foundation

public final class PrintServiceProvider: AbstractProvider, Service {
    public let supportedTags: [Tag] = [.debugging]

    private let canBeDisabled: Bool
    private let put: (String) -> Void

    public init(canBeDisabled: Bool, put: @escaping (String) -> Void = { print($0) }) {
        self.canBeDisabled = canBeDisabled
        self.put = put
    }

    public func trackEvent(_ event: Event) {
        if !event.parameters.isEmpty {
            let stringParams = event
                .parameters
                .map { $0.key + " = " + $0.value }
                .joined(separator: ", ")
            put("Tracking event: \(event.name); with parameters: \(stringParams)")
        } else {
            put("Tracking event: \(event.name)")
        }
    }

    override public func disableTracking(_ flag: Bool) {
        put("Disabling tracking")
        if canBeDisabled {
            super.disableTracking(flag)
        }
    }
}
