import Foundation

public struct NamedScreen: Screen {
    public let name: String

    public init(_ name: String) {
        self.name = name
    }
}

extension NamedScreen: ExpressibleByStringLiteral {
    public init(stringLiteral name: StaticString) {
        self.init(name.description)
    }
}
