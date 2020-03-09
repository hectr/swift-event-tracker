import Foundation
import XCTest

public func Assert(_ expression: @autoclosure () throws -> Bool?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) throws {
    let value = try expression()
    XCTAssertNotNil(value, message(), file: file, line: line)
    XCTAssert(value ?? false, message(), file: file, line: line)
}

public func AssertFalse(_ expression: @autoclosure () throws -> Bool?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) throws {
    let value = try expression()
    XCTAssertNotNil(value, message(), file: file, line: line)
    XCTAssertFalse(value ?? true, message(), file: file, line: line)
}

public func AssertTrue(_ expression: @autoclosure () throws -> Bool?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) throws {
    let value = try expression()
    XCTAssertNotNil(value, message(), file: file, line: line)
    XCTAssertTrue(value ?? false, message(), file: file, line: line)
}
