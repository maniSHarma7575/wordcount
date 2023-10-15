# WordCount Tool

The WordCount tool is a Ruby-based utility that provides information about files, including the number of lines, words, characters, bytes, and the length of the longest line. If you supply multiple files as input, it will generate this information for each file and also provide a total summary at the end.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)

## Installation

```bash
# Clone the repository
git clone https://github.com/maniSHarma7575/wordcount

# Change directory
cd wordcount

# Run rubocop & test
bundle exec rake

# Add as linux command

ln -s wc-tool/bin/wordcount /usr/local/bin/wordcount
```

## Usage

You can use wordcount utility by running command in your terminal:

`wordcount [-Lclmw] [file ...]`

### Description

Following options are available:

- `-L`: Write the length of the line containing the most bytes (default) or characters (when -m is provided) to standard output.
- `-c`: The number of bytes in each input file is written to the standard output.  This will cancel out any prior usage of the -m option.
- `-l`: The number of lines in each input file is written to the standard output.
- `-m`: The number of characters in each input file is written to the standard output.  If the current locale does not support multibyte characters, this is equivalent to the -c option.  This will cancel out any prior usage of the -c option.
- `-w`: The number of words in each input file is written to the standard output.

## Contributing

Thank you for your interest in contributing to our project! We welcome your suggestions, improvements, or contributions. To get started, follow these steps:

### 1. Fork the Project

Click the "Fork" button on the top-right corner of this repository to create your own copy of the project.

### 2. Create a New Branch

Once you've forked the project, it's a good practice to create a new branch for your changes. This keeps your changes isolated and makes it easier to manage multiple contributions.

```bash
git checkout -b your-new-branch
