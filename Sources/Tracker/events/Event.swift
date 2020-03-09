import Foundation

public protocol Event: Taggable {
    var name: String { get }
    var parameters: [String: String] { get }
}

extension Event {
    public var parameters: [String: String] { [:] }
}
