protocol Printing {
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
