protocol FileReading {
    func contentsOfFile(_ path: String) throws -> String
}

struct FileSystemReader: FileReading {
    func contentsOfFile(_ path: String) throws -> String {
        try String(contentsOfFile: path, encoding: .utf8)
    }
}

struct InMemoryReader: FileReading {
    var contentsByPath: [String: String] = [:]

    func contentsOfFile(_ path: String) throws -> String {
        if let contents = contentsByPath[path] {
            return contents
        } else {
            throw Error.fileNotFound
        }
    }

    enum Error: Swift.Error {
        case fileNotFound
    }
}
