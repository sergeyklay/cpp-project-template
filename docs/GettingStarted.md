# Stars: Getting Started

This is a small C++ template program showing a project build using [CMake][cmake]
as build generator with integrated [Conan][conan] package manager consuming (using
and linking) with [SQLite][sqlite] and [spdlog][spdlog] libraries. For UNIX-like
systems this project uses [GNU Make][make] build tool, but it can build with other
tools like [Ninja][ninja]. Actually there is no restriction for using Ninja even
on Windows systems.

## How to try it out

These instructions will get you a copy of the Stars project up and running on
your local machine for development and testing purposes.

### Prerequisites

To build and run Stars you'll need the following requirements:

- A C++17 compatible compiler such as
  - [GCC][gcc] >= 7.0.0
  - [Clang][clang] >= 5.0.0
  - [Apple Clang][apple clang] >= 10.0.0
  - [Visual Studio][vs] >= 2017 (15.7)
- [CMake][cmake] 3.14 or later
- Any build tool supported by CMake like [GNU Make][make], [Ninja][ninja] and so on
- [Conan][conan] decentralized package manager with a client-server architecture
- [SQLite][sqlite] >= 3.0

For project dependencies list see `conanfile.txt` bundled with this project.

Optional prerequisites are:

- Static analysis tool for C/C++ code: [Cppcheck][cppcheck] >= 1.89
- Static analysis tool for C/C++ code: [Cpplint][cpplint] >= 1.5
- C, C++ formatting tool: [clang-format][clang-format] >= 10.0

If you're using Ubuntu, you can install the required packages this way:

```shell script
$ sudo apt install gcc cmake build-essential sqlite3
```

On macOS you most likely have a compiler and SQLite so you'll need only CMake:

```shell script
$ brew install cmake
```

To use Ninja CMake's generator you will need to install Ninja:

```shell script
# Arch Linux
$ sudo pacman -S ninja

# Fedora
$ sudo dnf install ninja-build

# Debian/Ubuntu
$ sudo apt install ninja-build

# Gentoo
$ sudo emerge dev-util/ninja

# macOS
$ brew install ninja

# Windows
$ choco install ninja
```

Please note that specific versions of libraries and programs at the time of
reading this guide may vary. The following dependencies is recommended install
using [pip][pip]:

- `conan`
- `cpplint`

They can be installed using pip as follows:

```shell script
$ pip install -r requirements.txt
```

#### Configure flags

To enable any feature use CMake flags at configure time.
To enable `FEATURE` use `-DFEATURE=ON` and to disable `FEATURE` use `-DFEATURE=OFF`.
Custom CMake flags are:

| Flag                            | Description                                               |
| ------------------------------- |-----------------------------------------------------------|
| `CPPCHECK`                      | Add `cppcheck` step to the compilation.                   |
| `CMAKE_EXPORT_COMPILE_COMMANDS` | Enable output of compile commands during generation.      |
| `WARNINGS_AS_ERRORS`            | Turn all build warnings into errors.                      |

To use `cppcheck` you will need to install it as follows:

```shell script
# Arch Linux
$ sudo pacman -S cppcheck

# Fedora
$ sudo dnf install cppcheck

# Ubuntu
$ sudo snap install cppcheck

# Debian
$ sudo apt install cppcheck

# Gentoo
$ sudo emerge dev-util/cppcheck

# macOS
$ brew install cppcheck

# Windows
$ choco install cppcheck
```

### Build

You may want to install optional dependencies to perform additional code style
checks. To install them use `pip` from the project directory as follows:

```shell script
$ pip install -r requirements.txt
```

**Note:** To be able automatic reformatting C/C++ code you'll need to install
[clang-format][clang-format]. The `clang-format` tool itself has already been
included in the repositories of popular Linux distributions for a long time.
Search for `clang-format` in your repositories.  Otherwise, you can either
download pre-built LLVM/clang binaries or build the source code from
https://releases.llvm.org/download.html.

Next, initialize project with `conan` - this is using the `conanfile.txt` specifying
that SQLite is an dependency and that `conan` should integrate with CMake:

```shell script
$ conan install . -if=build --build=missing
```

This example establishes out-of-source `build/` folder, so that source folder
is not polluted. For a detailed instruction on how to use and customize `conan`
please refer [here][conan-start].

Next, generate the build files using CMake:

```shell script
$ cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release
```

To use Ninja CMake's generator, simply use CMake's `-G` [command-line option][cmake-cli]:

```shell script
$ cmake -H. -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release
```

You can use `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON` when generating the build
to have CMake create a `compile_commands.json` file for you. This is useful
for all sorts of tools (`clang-tidy`, `cppcheck`, `oclint`, `include-what-you-use`,
etc). Also you can specify the build type by using `CMAKE_BUILD_TYPE`. Supported
build types are `Debug`, `Release`, `RelWithDebInfo` and `MinSizeRel`:

```shell script
$ cmake                    \
  -H.                      \
  -Bbuild                  \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

Finally build project:

```shell script
$ cmake --build build
```

#### Install

To install program simple use `install` target:

```shell script
$ cmake --build build --target install
```

To be able install program in non standard location you'll need to change the installation prefix.
Use `-DCMAKE_INSTALL_PREFIX=/new/location` to change the prefix, e.g.:

```shell script
# Configure
$ cmake -DCMAKE_INSTALL_PREFIX=~/.local build

# Build program
$ cmake --build build

# Install. Thi will use custom prefix now
$ cmake --build build --target install
```

### Run

If everything went successfully, you can run the built executable:

```shell script
$ /usr/local/bin/stars
```

Expected output will something like:

```
Chuck Norris can kill two stones with one bird.
```

If you used a custom prefix, you'll need to use appropriate path:

```shell script
$ cmake -DCMAKE_INSTALL_PREFIX=~/.local build
$ cmake --build build
$ cmake --build build --target install
$ ~/.local/bin/stars
```

### Further Reading

- [`cmake-buildsystem(7)`][cmake-buildsystem]

## License

This project is open source software licensed under the Apache License 2.0.
See the [LICENSE][license] file for more information.

[ninja]: https://ninja-build.org/
[conan]: https://conan.io/
[sqlite]: https://www.sqlite.org/index.html
[spdlog]: https://github.com/gabime/spdlog
[conan-start]: https://docs.conan.io/en/latest/getting_started.html
[gcc]: https://gcc.gnu.org/
[clang]: https://clang.llvm.org/
[apple clang]: https://apps.apple.com/us/app/xcode/id497799835
[vs]: https://visualstudio.microsoft.com
[cmake]: https://cmake.org/
[make]: https://www.gnu.org/software/make/
[cppcheck]: https://github.com/danmar/cppcheck
[cpplint]: https://github.com/cpplint/cpplint
[clang-format]: https://clang.llvm.org/docs/ClangFormat.html
[pip]: https://pip.pypa.io/
[cmake-cli]: https://cmake.org/cmake/help/latest/manual/cmake.1.html
[cmake-buildsystem]: https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html
[license]: https://github.com/sergeyklay/cpp-project-template/blob/master/LICENSE
