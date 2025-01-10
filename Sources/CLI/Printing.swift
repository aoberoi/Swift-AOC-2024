protocol Printing {
    // NOTE: The following requirement uses mutating to signal that conforming types are _allowed_ to use a mutating
    // func, not that they are required to use a mutating func.
    mutating func print(_ items: Any..., separator: String, terminator: String)
}

// This extension is only used to ensure that callers can benefit from the default arguments
extension Printing {
    mutating func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        print(items, separator: separator, terminator: terminator)
    }
}

struct StandardOutPrinter: Printing {
    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        Swift.print(items, separator: separator, terminator: terminator)
    }
}

struct StringPrinter: Printing {
    var printedItems: [String] = []

    mutating func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        var buffer = ""
        Swift.print(items, separator: separator, terminator: terminator, to: &buffer)
        printedItems.append(buffer)
    }

    mutating func clear() {
        printedItems.removeAll()
    }
}

// Helps enforce the use of a Printing type by turning all bare calls to the global print() into compiler errors
@available(*, unavailable, message: "print() is disallowed in this program. Use a type that conforms to Printing")
public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
}
