# Boilerplate for C++ projects

[![Build Status][build badge]][build link]
[![Analysis Status][analysis badge]][analysis link]

This repository contains my personal boilerplate for C++ projects.

You can generate a new repository with the same directory structure
and files as an existing repository. For more see:

- [Creating a repository from a template][gh-template]

## Features

- Sources, headers and mains separated in distinct folders
- [Modern CMake][modern-cmake] for much easier compiling
- Continuous testing with GitHub Actions on all modern platforms, with support for C++17.
- Setup for tests using Google Test
- **[TODO]** Code coverage reports, including automatic upload to Codecov.io
- **[TODO]** Code documentation with Doxygen

### Project Structure and Tools

- Type: Shared Library
  - `so` file on Linux
  - `dylib` file on macOS
  - `dll` file on Windows
- Source: multiple files
- C++ version: `C++17`
- Tested OS: Linux, macOS and Windows
- C++ compiler: [GCC][gcc], [Clang][clang], [Apple Clang][apple clang] or [Visual Studio][vs]
- Package manager: [Conan][conan]
- Build system: [CMake][cmake]
- Libraries: STL, [`sqlite3`][sqlite], [`spdlog`][spdlog]
- Formatting tools: [clang-format][clang-format]
- Static analysis tools: [Cpplint][cpplint], [Cppcheck][cppcheck]
- CI: [GitHub Actions][actions]

## Getting Started

See [`docs/GettingStarted.md`](./docs/GettingStarted.md) for more.

## License

This project is open source software licensed under the Apache License 2.0.
See the [LICENSE][license] file for more information.

[build link]: https://github.com/sergeyklay/cpp-project-template/actions?query=workflow%3Abuild
[build badge]: https://github.com/sergeyklay/cpp-project-template/workflows/build/badge.svg
[analysis link]: https://github.com/sergeyklay/cpp-project-template/actions?query=workflow%3Aanalysis
[analysis badge]: https://github.com/sergeyklay/cpp-project-template/workflows/analysis/badge.svg
[gh-template]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
[gcc]: https://gcc.gnu.org/
[clang]: https://clang.llvm.org/
[apple clang]: https://apps.apple.com/us/app/xcode/id497799835
[vs]: https://visualstudio.microsoft.com
[conan]: https://conan.io/
[cmake]: https://cmake.org/
[sqlite]: https://www.sqlite.org/index.html
[spdlog]: https://github.com/gabime/spdlog
[actions]: https://github.com/features/actions
[modern-cmake]: https://gist.github.com/mbinna/c61dbb39bca0e4fb7d1f73b0d66a4fd1
[cpplint]: https://github.com/cpplint/cpplint
[cppcheck]: https://github.com/danmar/cppcheck
[clang-format]: https://clang.llvm.org/docs/ClangFormat.html
[license]: https://github.com/sergeyklay/cpp-project-template/blob/master/LICENSE
