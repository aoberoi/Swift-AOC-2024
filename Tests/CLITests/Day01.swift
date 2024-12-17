import Testing
import ArgumentParser
@testable import CLI

@Test func executesCommand() throws {
    var command = try Day01.parse(["someFilename"])
    let printer = StringPrinter()
    command.printer = printer

    try command.run()

    let printedItems = printer.printedItems
    // let stringPrinter = try #require(command.printer as? StringPrinter)
    // let printedItems = stringPrinter.printedItems
    #expect(printedItems.count == 1)

    print(printer.printedItems)
}
