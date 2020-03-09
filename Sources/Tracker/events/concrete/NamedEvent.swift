import Foundation

public struct NamedEvent: Event {
    public let name: String

    public init(_ name: String) {
        self.name = name
    }
}

extension NamedEvent: ExpressibleByStringLiteral {
    public init(stringLiteral name: StaticString) {
        self.init(name.description)
    }
}
