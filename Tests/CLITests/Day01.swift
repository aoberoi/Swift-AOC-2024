import Testing
import ArgumentParser
@testable import CLI

@Test func executesCommand() throws {
    let command = try Day01.parse(["someFilename"])
    try command.run()
    // TODO: I have no idea how to inject a buffered print()-style function that can be used to inspect the result of
    // the command. I've tried a few different things:
    // * Adding a property of type that is identical to Swift.print, with a default value of Swift.print, and then
    //   updating that property at runtime during tests to some kind of buffered print function implementation.
    //   - This makes the type fail to fulfill the Decodable requirement. I tryied to figure out how to make that work,
    //     including seeing some hint regarding implementing validate() for extra processing, but I couldn't figure it
    //     out.
    // * Adding a static property to the type, so that it doesn't need to be decoded ever.
    //   - This won't work because I couldnt figure out how to properly describe the type of Swift.print, in a way that
    //     I could invoke it without the error that I'm missing parameters #2 and #3. Those parameters have default
    //     values in the Swift.print function signature.
    //   - There was some under-understood feedback from the compiler regarding concurrency. Used @MainActor to just
    //     plow through that feedback.
    // * Thinking about putting the inspectable printing functionality into another protocol, and making the command
    //   conform to that.
    //   - But then I still need some kind of stored property for at least a flag about whether I'm really printing or
    //     not.
    // * Thinking about putting the functionality into some shared singleton. Afterall, Swift.print is a shared
    //   reference to a function.
    #expect(true == true)
}
