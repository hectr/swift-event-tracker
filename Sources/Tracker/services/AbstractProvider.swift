import Foundation

open class AbstractProvider {
    public private(set) var trackingDisabled: Bool = false

    var userProperties: [String: Any] = [:]

    open func disableTracking(_ flag: Bool) {
        trackingDisabled = flag
    }
}
