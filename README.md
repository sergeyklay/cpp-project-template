# Boilerplate for C++ projects

[![Build Status][build badge]][build link]
[![Analysis Status][analysis badge]][analysis link]
[![Code Analytics][codacy badge]][codacy link]

This repository contains my personal boilerplate for C++ projects.

You can generate a new repository with the same directory structure
and files as an existing repository. For more see:

-   [Creating a repository from a template][gh-template]

## Features

-   [x] Sources, headers and mains separated in distinct folders
-   [x] [Modern CMake][modern-cmake] for much easier compiling
-   [x] Continuous testing with GitHub Actions on all modern platforms, with support for C++17.
-   [x] Setup for tests using Google's C++ test framework
-   [ ] x86 and x64 builds
-   [ ] Code coverage reports, including automatic upload to Codecov.io
-   [ ] Code documentation with Doxygen
-   [ ] Create releases and attach artifacts using GitHub Actions

### Project Structure and Tools

-   Source: multiple files
-   Type: Shared Library (`so` on Linux, `dylib` on macOS and `dll` on Windows) with [Pimpl][pimpl] implementation
-   C++ version: `C++17`
-   Tested OS: Linux, macOS and Windows
-   C++ compiler: [GCC][gcc], [Clang][clang], [Apple Clang][apple clang] or [Visual Studio][vs]
-   Package manager: [Conan][conan]
-   Build system: [CMake][cmake]
-   Libraries: STL, [`sqlite3`][sqlite], [`spdlog`][spdlog]
-   Formatting tools: [clang-format][clang-format]
-   Static analysis tools: [Cpplint][cpplint], [Cppcheck][cppcheck]
-   CI: [GitHub Actions][actions]

## Getting Started

See [`docs/GettingStarted.md`](./docs/GettingStarted.md) for more.

## License

This project is open source software licensed under the Apache License 2.0.
See the [LICENSE][license] file for more information.

[build link]: https://github.com/sergeyklay/cpp-project-template/actions?query=workflow%3Abuild
[build badge]: https://github.com/sergeyklay/cpp-project-template/workflows/build/badge.svg
[analysis link]: https://github.com/sergeyklay/cpp-project-template/actions?query=workflow%3Aanalysis
[analysis badge]: https://github.com/sergeyklay/cpp-project-template/workflows/analysis/badge.svg
[codacy badge]: https://app.codacy.com/project/badge/Grade/817c63485ffe441bbbdab2a4e2229ac1
[codacy link]: https://www.codacy.com/manual/klay/cpp-project-template/dashboard
[gh-template]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
[pimpl]: https://en.cppreference.com/w/cpp/language/pimpl
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
