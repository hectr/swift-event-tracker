import Foundation

extension Service {
    func containsAny(from tags: [Tag]) -> Bool {
        guard !tags.isEmpty else {
            return true
        }
        let containsAny = tags.contains { tag in self.supportedTags.contains { $0 == tag } }
        return containsAny
    }

    func containsNone(from tags: [Tag]) -> Bool {
        guard !tags.isEmpty else {
            return true
        }
        return !containsAny(from: tags)
    }
}
