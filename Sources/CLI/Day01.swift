import Foundation
import ArgumentParser

struct Day01: ParsableCommand {

    @Argument var inputFile: String

    enum CodingKeys: String, CodingKey {
        case inputFile
    }

    // TODO: It's not ideal that this is publicly mutable. Any way to only allow test code to mutate? Is that what
    // @testable does? Another approach is to use an init(), but then we don't get to exercise the parsing code in our
    // tests.
    var printer: Printing = StandardOutPrinter()

    // Historian Hysteria
    //
    // The input contains 2 lists of location IDs (these are integers). The smallest location ID in one list must be
    // paired with the smallest locaiton ID in the second list. The next smallest in the first list should be paired
    // with the next smallest in the second list. And so on.
    // For each pair, we must compute a distance, which is the difference in those integers. Distances are always
    // positive.
    // The total distance, which is the sum of the individual pair distances, is output as the result.
    mutating func run() throws {
        // TODO: open inputFile for reading

        // Initialize two lists
        var leftList: [Int] = []
        var rightList: [Int] = []

        // TODO: As I read the input, append the locations into each list.

        leftList.sort()
        rightList.sort()

        assert(leftList.count == rightList.count)

        var totalDistance = 0
        for (leftLocationID, rightLocationID) in zip(leftList, rightList) {
            totalDistance += abs(leftLocationID - rightLocationID)
        }

        printer.print(totalDistance)
    }


}
