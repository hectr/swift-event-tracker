import Foundation

public protocol CountlyScreen: Screen {
    var segmentation: [String: String] { get }
}
