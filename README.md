# Advent of Code 2024, in Swift

[Advent of Code](https://adventofcode.com/2024) is an incredible tradition full of programming
exercises. It's a great sandbox for trying out new technologies, techniques, or constraints as a
programmer.

This year, I'm taking the opportunity to practice and learn a things in particular:
* The Swift programming language **outside of Apple platforms**.
  -  Building for Linux creates a more clear separation between the frameworks/technologies built
     into Apple operating systems and what Swift offers as an open source toolchain and package
     ecosystem.
* SwiftPM build system and packaging
* Dev Containers in VSCode
* Swift Testing
* Swift Argument Parser
* ... and others that pique my curiosity

## Usage

The project is a command line utility, divided into subcommands for each daily problem. Each command
expects a path to the file with the input, and responds with the solution. Note: each user must
[log in](https://adventofcode.com/2024/auth/login) to obtain a personalized input for each problem.

An example of running the CLI to solve the Day 1 problem, where the input was saved into a file
named `input.txt`:

```shell
$ aoc2024 day01 input.txt
```

The CLI will print help text if the command is invalid.

## Development

This project requires Swift version 6.0 or later to build. Its designed to be built and run on
Linux. The dependencies can be downloaded and the project can be built using SwiftPM.

It's recommended to use VSCode, with the Dev Containers extension, configured to run with a local
Docker engine. Furthermore, if you're running on a Mac, I'd also recommend using OrbStack as an
alternative to Docker Desktop. If you're following these recommendations, all you need to do is
clone this repository and open the folder in VSCode. It should prompt you to reopen in a
DevContainer, and once you do, all the extensions, images, and dependencies will be loaded
automatically.
