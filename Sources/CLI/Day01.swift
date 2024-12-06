import ArgumentParser

struct Day01: ParsableCommand {

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
        // TODO: Read the inputFile
        print("Executing Day01")
    }
}
