import Foundation

public struct TaggedEvent: Event {
    public let name: String
    public let parameters: [String: String]
    public let excludedTags: [Tag]
    public let requiredTags: [Tag]

    public init(name: String, parameters: [String : String], excludedTags: [Tag], requiredTags: [Tag]) {
        self.name = name
        self.parameters = parameters
        self.excludedTags = excludedTags
        self.requiredTags = requiredTags
    }
}
