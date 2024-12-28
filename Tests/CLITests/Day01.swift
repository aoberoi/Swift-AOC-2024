import Testing
import ArgumentParser
@testable import CLI

@Test func executesCommand() async throws {
    var command = try Day01.parse(["TODO.txt"])
    command.printer = StringPrinter()

    try await command.run()

    let stringPrinter = try #require(command.printer as? StringPrinter)
    let printedItems = stringPrinter.printedItems
    #expect(printedItems.count == 1)
}
