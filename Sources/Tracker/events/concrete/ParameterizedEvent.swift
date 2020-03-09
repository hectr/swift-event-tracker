import Foundation

public struct ParameterizedEvent: Event {
    public let name: String
    public let parameters: [String: String]

    public init(name: String, parameters: [String : String]) {
        self.name = name
        self.parameters = parameters
    }
}
