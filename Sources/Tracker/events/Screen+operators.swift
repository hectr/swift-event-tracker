import Foundation

infix operator +

public func + (left: NamedScreen, right: Tag) -> TaggedScreen {
    TaggedScreen(name: left.name,
                 excludedTags: left.excludedTags,
                 requiredTags: left.requiredTags + [right])
}

public func + (left: TaggedScreen, right: Tag) -> TaggedScreen {
    TaggedScreen(name: left.name,
                 excludedTags: left.excludedTags,
                 requiredTags: left.requiredTags + [right])
}

public func + (left: NamedScreen, right: [Tag]) -> TaggedScreen {
    TaggedScreen(name: left.name,
                 excludedTags: left.excludedTags,
                 requiredTags: left.requiredTags + right)
}

public func + (left: TaggedScreen, right: [Tag]) -> TaggedScreen {
    TaggedScreen(name: left.name,
                 excludedTags: left.excludedTags,
                 requiredTags: left.requiredTags + right)
}

infix operator -

public func - (left: NamedScreen, right: Tag) -> TaggedScreen {
    TaggedScreen(name: left.name,
                 excludedTags: left.excludedTags + [right],
                 requiredTags: left.requiredTags)
}

public func - (left: TaggedScreen, right: Tag) -> TaggedScreen {
    TaggedScreen(name: left.name,
                 excludedTags: left.excludedTags + [right],
                 requiredTags: left.requiredTags)
}

public func - (left: NamedScreen, right: [Tag]) -> TaggedScreen {
    TaggedScreen(name: left.name,
                 excludedTags: left.excludedTags + right,
                 requiredTags: left.requiredTags)
}

public func - (left: TaggedScreen, right: [Tag]) -> TaggedScreen {
    TaggedScreen(name: left.name,
                 excludedTags: left.excludedTags + right,
                 requiredTags: left.requiredTags)
}
