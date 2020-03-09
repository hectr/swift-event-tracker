import Foundation
import Tracker

extension ScreenMock {
    public convenience init(name: String,
                requiredTags: [Tag] = [],
                excludedTags: [Tag] = []) {
        self.init()
        self.underlyingName = name
        self.requiredTags = requiredTags
        self.excludedTags = excludedTags
    }
}
