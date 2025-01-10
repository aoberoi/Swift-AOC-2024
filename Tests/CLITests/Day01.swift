import Testing
import ArgumentParser
@testable import CLI

@Test func solvesPartOne() async throws {
    // Arrange
    let path = "sample.txt"
    var command = try Day01.parse([path])

    command.printer = StringPrinter()

    var fileReader = InMemoryReader()
    fileReader.contentsByPath[path] = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    command.fileReader = fileReader

    // Act
    try await command.run()

    // Assert
    let stringPrinter = try #require(command.printer as? StringPrinter)
    let output = try #require(stringPrinter.printedItems.first)
    #expect(stringPrinter.printedItems.count == 1)
    #expect(output.trimmingCharacters(in: .whitespacesAndNewlines) == "\(11)")
}

@Test func solvesPartTwo() async throws {
    // Arrange
    let path = "sample.txt"
    var command = try Day01.parse(["--part-two", path])

    command.printer = StringPrinter()

    var fileReader = InMemoryReader()
    fileReader.contentsByPath[path] = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    command.fileReader = fileReader

    // Act
    try await command.run()

    // Assert
    let stringPrinter = try #require(command.printer as? StringPrinter)
    let output = try #require(stringPrinter.printedItems.first)
    #expect(stringPrinter.printedItems.count == 1)
    #expect(output.trimmingCharacters(in: .whitespacesAndNewlines) == "Not yet implemented")
}
