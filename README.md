# Stars

[![Build Status][build badge]][build link]
[![Analysis Status][analysis badge]][analysis link]

This repository contains my personal repository template for C++ project.

- Type: Shared Library
- Source: multiple files
- C++ version: `C++17`
- Tested OS: macOS, Ubuntu
- C++ compiler: [GCC][gcc], [Clang][clang] or [Apple Clang][apple clang]
- Package manager: [Conan][conan]
- Build system: [CMake][cmake]
- Libraries: STL, [`sqlite3`][sqlite], [`spdlog`][spdlog]
- Formatting tools: [cmake-format][cmake-format], [clang-format][clang-format]
- Static analysis tools: [Cpplint][cpplint], [Cppcheck][cppcheck]
- CI: [GitHub Actions][actions]

## Getting Started

See [`docs/GettingStarted.md`](./docs/GettingStarted.md) for more.

## License

This project is open source software licensed under the Apache License 2.0.
See the [LICENSE][license] file for more information.

[build link]: https://github.com/sergeyklay/cpp-project-templates/actions?query=workflow%3Abuild
[build badge]: https://github.com/sergeyklay/cpp-project-templates/workflows/build/badge.svg
[analysis link]: https://github.com/sergeyklay/cpp-project-templates/actions?query=workflow%3Aanalysis
[analysis badge]: https://github.com/sergeyklay/cpp-project-templates/workflows/analysis/badge.svg
[gcc]: https://gcc.gnu.org/
[clang]: https://clang.llvm.org/
[apple clang]: https://apps.apple.com/us/app/xcode/id497799835
[conan]: https://conan.io/
[cmake]: https://cmake.org/
[sqlite]: https://www.sqlite.org/index.html
[spdlog]: https://github.com/gabime/spdlog
[actions]: https://github.com/features/actions
[cpplint]: https://github.com/cpplint/cpplint
[cppcheck]: https://github.com/danmar/cppcheck
[cmake-format]: https://github.com/cheshirekow/cmake_format
[clang-format]: https://clang.llvm.org/docs/ClangFormat.html
[license]: https://github.com/sergeyklay/cpp-project-templates/blob/master/LICENSE
