import Testing
import ArgumentParser
@testable import CLI

@Test func executesCommand() throws {
    var command = try Day01.parse(["someFilename"])
    command.printer = StringPrinter()

    try command.run()

    let stringPrinter = try #require(command.printer as? StringPrinter)
    let printedItems = stringPrinter.printedItems
    #expect(printedItems.count == 1)
}
