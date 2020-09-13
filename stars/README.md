# Stars

A template project with integrations of the following tools:

- [CMake][cmake]
- [Ninja][ninja]
- [SQLite][sqlite]
- [Conan][conan]

## How to try it out

These instructions will get you a copy of the Stars project up and running on
your local machine for development and testing purposes.

### Prerequisites

To build Stars you'll need the following requirements:

- A C++17 compatible compiler such as
  - [Gcc][gcc] >= 7.0.0
  - [Clang][clang] >= 5.0.0
  - [Apple Clang][apple clang] >= 10.0.0
- [CMake][cmake] 3.14 or later
- Any supported by CMake build tools like [GNU Make][make], [Ninja][ninja] and so on
- [Conan][conan] decentralized package manager with a client-server architecture

For project dependencies list see `conanfile.txt` bundled with this project.

Optional prerequisites are:

- Static analysis tool for C/C++ code: [Cpplint][cpplint]
- CMake formatting tool: [cmake-format][cmake-format]
- C, C++ formatting tool: [clang-format][clang-format]

If you're using Ubuntu, you can install the required packages this way:

```shell script
$ sudo apt install gcc cmake build-essential
```

On macOS you most likely have a compiler so you'll need only CMake:

```shell script
$ brew install cmake
```

To use Ninja CMake's generator you will need to install `ninja-build`:

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
```

Please note that specific versions of libraries and programs at the time of
reading this guide may vary. The following dependencies is recommended install
using [pip][pip]:

- `conan`
- `cmakelang`
- `clang-format`
- `cpplint`

They can be installed using pip as follows:

```shell script
$ pip install --user -r requirements.txt
```

### Build

First you'll need clone the project:

```shell script
$ git clone https://github.com/sergeyklay/cpp-project-templates
$ cd cpp-project-templates
```

You may want to install optional dependencies to perform additional code style checks.
To install them use `pip` from `stars` directory as follows:

```shell script
$ cd stars
$ pip install --user -r requirements.txt
```

**Note:** On macOS to install `clang-format` you'll need use `brew`:

```shell script
$ brew install clang-format
```

Install project dependencies from `stars` directory using `conan` as follows:

```shell script
$ conan install . -if=$(pwd)/build --build=missing
```

For a detailed instruction on how to use and customize `conan` please refer
[here][conan-start]. Next configure project as follows:

```shell script
$ cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release
```

To use Ninja CMake's generator, simply use CMake's `-G` [command-line option][cmake-cli]:
```shell script
$ cmake -H. -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release
```

Finally build it:
```shell script
$ cmake --build build
```

### Further Reading

- [`cmake-buildsystem(7)`][cmake-buildsystem]

## License

This project is open source software licensed under the Apache License 2.0.
See the [LICENSE][license] file for more information.

[sqlite]: https://www.sqlite.org/index.html
[ninja]: https://ninja-build.org/
[conan]: https://conan.io/
[conan-start]: https://docs.conan.io/en/latest/getting_started.html
[gcc]: https://gcc.gnu.org/
[clang]: https://clang.llvm.org/
[apple clang]: https://apps.apple.com/us/app/xcode/id497799835
[cmake]: https://cmake.org/
[make]: https://www.gnu.org/software/make/
[cpplint]: https://github.com/cpplint/cpplint
[cmake-format]: https://github.com/cheshirekow/cmake_format
[clang-format]: https://clang.llvm.org/docs/ClangFormat.html
[pip]: https://pip.pypa.io/
[cmake-cli]: https://cmake.org/cmake/help/latest/manual/cmake.1.html
[cmake-buildsystem]: https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html
[license]: https://github.com/sergeyklay/cpp-project-templates/blob/master/LICENSE
