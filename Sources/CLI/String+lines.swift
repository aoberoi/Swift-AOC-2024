extension String {
    var lines: some Sequence<String> {
        self.components(separatedBy: "\n")
    }
}
