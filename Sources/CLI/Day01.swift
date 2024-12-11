import ArgumentParser

struct Day01: ParsableCommand {

    // @MainActor
    // static var print: (Any..., _ separator: String, _ terminator: String) -> Void = Swift.print

    @Argument var inputFile: String

    // Historian Hysteria
    //
    // The input contains 2 lists of location IDs (these are integers). The smallest location ID in one list must be
    // paired with the smallest locaiton ID in the second list. The next smallest in the first list should be paired
    // with the next smallest in the second list. And so on.
    // For each pair, we must compute a distance, which is the difference in those integers. Distances are always
    // positive.
    // The total distance, which is the sum of the individual pair distances, is output as the result.
    func run() throws {
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

        print(totalDistance)
    }


}
