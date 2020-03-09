import Foundation
import Tracker
import XCTest

public func AssertTrackEventCalled(_ provider: ServiceMock,
                                 message: @autoclosure () -> String = "",
                                 file: StaticString = #file,
                                 line: UInt = #line) {
    XCTAssertTrue(provider.trackEventCalled,
                  message(),
                  file: file,
                  line: line)
}

public func AssertTrackEventNotCalled(_ provider: ServiceMock,
                                    message: @autoclosure () -> String = "",
                                    file: StaticString = #file,
                                    line: UInt = #line) {
    XCTAssertFalse(provider.trackEventCalled,
                   message(),
                   file: file,
                   line: line)
}

public func AssertEventTracked(_ event: NamedEvent,
                               params: [String: String] = [:],
                               to provider: ServiceMock,
                               message: @autoclosure () -> String = "",
                               file: StaticString = #file,
                               line: UInt = #line) {
    let lastEvent = provider.trackEventReceivedEvent
    XCTAssertEqual(lastEvent?.name,
                   event.name,
                   message(),
                   file: file,
                   line: line)
    XCTAssertEqual(lastEvent?.parameters,
                   params,
                   message(),
                   file: file,
                   line: line)
}

public func AssertEventNotTracked(_ event: NamedEvent,
                                  to provider: ServiceMock,
                                  message: @autoclosure () -> String = "",
                                  file: StaticString = #file,
                                  line: UInt = #line) {
    XCTAssertNotEqual(provider.trackEventReceivedEvent?.name,
                      event.name,
                      message(),
                      file: file,
                      line: line)
}

public func AssertEventsTracked(_ events: NamedEvent...,
                                to provider: ServiceMock,
                                ignoreAdditionalEvents: Bool = false,
                                message: @autoclosure () -> String = "",
                                file: StaticString = #file,
                                line: UInt = #line) {
    XCTAssertGreaterThan(events.count,
                         1,
                         "Use AssertEventTracked() instead",
                         file: file,
                         line: line)
    let selected = provider
        .trackEventReceivedInvocations
        .filter { event in !ignoreAdditionalEvents || events.map { $0.name }.contains(event.name) }
    XCTAssertEqual(selected.map { $0.name },
                   events.map { $0.name },
                   message(),
                   file: file,
                   line: line)
}
