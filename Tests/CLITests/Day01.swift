import Testing
import ArgumentParser
@testable import CLI

@Test func solvesPartOne() async throws {
    // Arrange
    let path = "sample.txt"
    var command = try setUpCommand(samplePath: path)

    // Act
    try await command.run()

    // Assert
    let output = try requireSingleOutput(command)
    #expect(output == "\(11)")
}

@Test func solvesPartTwo() async throws {
    // Arrange
    let path = "sample.txt"
    var command = try setUpCommand(samplePath: path, additionalArgs: ["--part-two"])

    // Act
    try await command.run()

    // Assert
    let output = try requireSingleOutput(command)
    #expect(output == "\(31)")
}

func setUpCommand(samplePath: String, additionalArgs: [String] = []) throws -> Day01 {
    var command = try Day01.parse(additionalArgs + [samplePath])
    command.printer = StringPrinter()
    var fileReader = InMemoryReader()
    fileReader.contentsByPath[samplePath] = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    command.fileReader = fileReader
    return command
}

func requireSingleOutput(_ command: Day01) throws -> String {
    let stringPrinter = try #require(command.printer as? StringPrinter)
    #expect(stringPrinter.printedItems.count == 1)
    let output = try #require(stringPrinter.printedItems.first)
    return output.trimmingCharacters(in: .whitespacesAndNewlines)
}
