import Foundation

public struct EventTracker {
    private var serviceProviders: [Service]
    
    public init(serviceProviders: [Service]) {
        self.serviceProviders = serviceProviders
    }
    
    public mutating func setServiceProviders(_ providers: [Service]) {
        self.serviceProviders = providers
    }
    
    // MARK: - Conditional tracking
    
    public func trackEvent(_ event: Event, given condition: () -> Bool) {
        guard condition() else { return }
        trackEvent(event)
    }
    
    public func trackEvent(_ event: Event, given condition: @autoclosure () -> Bool) {
        guard condition() else { return }
        trackEvent(event)
    }
    
    public func trackEvent(_ event: Event, given condition: () -> Bool, then: () -> Void) {
        guard condition() else { return }
        trackEvent(event)
        then()
    }
    
    public func trackEvent(_ event: Event, given condition: @autoclosure () -> Bool, then: @autoclosure () -> Void) {
        guard condition() else { return }
        trackEvent(event)
        then()
    }
    
    public func trackScreen(_ screen: Screen, given condition: () -> Bool) {
        guard condition() else { return }
        trackScreen(screen)
    }
    
    public func trackScreen(_ screen: Screen, given condition: @autoclosure () -> Bool) {
        guard condition() else { return }
        trackScreen(screen)
    }
    
    public func trackScreen(_ screen: Screen, given condition: () -> Bool, then: () -> Void) {
        guard condition() else { return }
        trackScreen(screen)
        then()
    }
    
    public func trackScreen(_ screen: Screen, given condition: @autoclosure () -> Bool, then: @autoclosure () -> Void) {
        guard condition() else { return }
        trackScreen(screen)
        then()
    }
    
    // MARK: - Tagged actions

    public func setUserId(_ userId: String, forTags tags: [Tag]) {
        guard !tags.isEmpty else { return }
        for provider in serviceProviders
            where provider.containsAny(from: tags) {
                provider.setUserId(userId)
        }
    }

    public func setProperty(_ key: String, value: String, forTags tags: [Tag]) {
        guard !tags.isEmpty else { return }
        for provider in serviceProviders
            where provider.containsAny(from: tags) {
                provider.setProperty(key, value: value)
        }
    }
    
    public func resetProperties(forTags tags: [Tag]) {
        guard !tags.isEmpty else { return }
        for provider in serviceProviders
            where provider.containsAny(from: tags) {
                provider.resetProperties()
        }
    }
    
    public func disableTracking(_ flag: Bool, forTags tags: [Tag]) {
        guard !tags.isEmpty else { return }
        for provider in serviceProviders
            where provider.containsAny(from: tags) {
                provider.disableTracking(flag)
        }
    }
}

// MARK: - Service conformance

extension EventTracker: Service {
    public var trackingDisabled: Bool {
        !serviceProviders.contains { !$0.trackingDisabled }
    }
    
    public var supportedTags: [Tag] { serviceProviders.flatMap { $0.supportedTags } }
    
    public func trackEvent(_ event: Event) {
        for provider in serviceProviders
            where !provider.trackingDisabled &&
                provider.containsNone(from: event.excludedTags) &&
                provider.containsAny(from: event.requiredTags) {
                    provider.trackEvent(event)
        }
    }
    
    public func trackScreen(_ screen: Screen) {
        for provider in serviceProviders
            where !provider.trackingDisabled &&
                provider.containsNone(from: screen.excludedTags) &&
                provider.containsAny(from: screen.requiredTags) {
                    provider.trackScreen(screen)
        }
    }
    
    public func setUserId(_ userId: String) {
        for provider in serviceProviders
            where !provider.trackingDisabled {
                provider.setUserId(userId)
        }
    }
    
    public func resetUserId() {
        for provider in serviceProviders {
            provider.resetUserId()
        }
    }
    
    public func setProperty(_ key: String, value: String) {
        for provider in serviceProviders
            where !provider.trackingDisabled {
                provider.setProperty(key, value: value)
        }
    }
    
    public func resetProperties() {
        for provider in serviceProviders {
            provider.resetProperties()
        }
    }
    
    public func disableTracking(_ flag: Bool) {
        for provider in serviceProviders {
            provider.disableTracking(flag)
        }
    }
}
