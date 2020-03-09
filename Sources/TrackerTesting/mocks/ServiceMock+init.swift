import Foundation
import Tracker

extension ServiceMock {
    public convenience init(tags: [Tag]) {
        self.init()
        self.underlyingTrackingDisabled = false
        self.supportedTags = tags
    }
}
