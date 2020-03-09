import Foundation

public struct TaggedScreen: Screen {
    public let name: String
    public let excludedTags: [Tag]
    public let requiredTags: [Tag]

    public init(name: String, excludedTags: [Tag], requiredTags: [Tag]) {
        self.name = name
        self.excludedTags = excludedTags
        self.requiredTags = requiredTags
    }
}
