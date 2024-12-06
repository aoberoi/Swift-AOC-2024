import ArgumentParser

@main
struct AOC2024: ParsableCommand {
    // TODO: add an optional Int positional argument, which figures out if it can be used to invoke the appropriate
    // subcommand. actually, maybe the right way to do this is to give the subcommands aliases for just a single number.

    static let configuration = CommandConfiguration(
        subcommands: [Day01.self]
    )
}
