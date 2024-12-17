protocol Printing {
    func print(_ items: Any..., separator: String, terminator: String)
}

// This extension is only used to ensure that callers can benefit from the default arguments
extension Printing {
    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        print(items, separator: separator, terminator: terminator)
    }
}

struct StandardOutPrinter: Printing {
    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        Swift.print(items, separator: separator, terminator: terminator)
    }
}

// The StringPrinter is a reference type because it's not just a container for a method, it also manages state. If it
// were implemented as a struct, the print() method would have to be mutating, which would trickle up to any value
// type that keeps an instance of StringPrinter in a property. Actually, this doesn't seem like a huge deal. Does the
// protocol need to be updated to have mutating on the method? Not sure. I ran tests this way (no mutating on the
// protocol) and the build seemed to work but tests failed with no real error, just "unexpected signal code 11"
class StringPrinter: Printing {
// struct StringPrinter: Printing {
    var printedItems: [String] = []

    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    // mutating func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        var buffer = ""
        Swift.print(items, separator: separator, terminator: terminator, to: &buffer)
        printedItems.append(buffer)
    }

    func clear() {
    // mutating func clear() {
        printedItems.removeAll()
    }
}
