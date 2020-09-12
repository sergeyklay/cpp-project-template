# Stars

A template project with integrations of the following tools:

- [CMake][cmake]
- [Ninja][ninja]

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
- Any supported CMake generator like [Unix Makefiles][make generator],
  [Ninja][ninja generator] and so on

Optional prerequisites are:

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

Please note that specific versions of libraries and programs at the time of
reading this guide may vary. The following dependencies is recommended install
using [pip][pip]:

- `cmakelang`
- `clang-format`

### Build

First you'll need clone the project:

```shell script
$ git clone https://github.com/sergeyklay/cpp-project-templates
$ cd cpp-project-templates
$ git submodule init
$ git submodule update
```

And wait for load any required dependencies. For git 1.6.1 or above you can
use something similar to command bellow to pull latest of all submodules:

```shell script
$ git submodule update --remote --merge
```

Nex, you can install optional dependencies using pip as follows:

```shell script
$ cmake-sqlite-conan
$ pip install --user -r requirements.txt
```

**Note:** On macOS to install `clang-format` you'll need use `brew`:

```shell script
$ brew install clang-format
```

Finally configure and build project as follows:

```shell script
$ cmake-sqlite-conan
$ cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release
$ cmake --build build
```

**Note:** To use Ninja CMake's generator, simply use CMake's `-G` [command-line option][cmake-cli]:
```shell script
$ cmake -H. -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release
```

### Further Reading

- [`cmake-buildsystem(7)`][cmake-buildsystem]

## License

This project is open source software licensed under the Apache License 2.0.
See the [LICENSE][license] file for more information.

[ninja]: https://ninja-build.org/
[gcc]: https://gcc.gnu.org/
[clang]: https://clang.llvm.org/
[apple clang]: https://apps.apple.com/us/app/xcode/id497799835
[cmake]: https://cmake.org/
[make generator]: https://cmake.org/cmake/help/latest/generator/Unix%20Makefiles.html
[ninja generator]: https://cmake.org/cmake/help/latest/generator/Ninja.html
[cmake-format]: https://github.com/cheshirekow/cmake_format
[clang-format]: https://clang.llvm.org/docs/ClangFormat.html
[pip]: https://pip.pypa.io/
[cmake-cli]: https://cmake.org/cmake/help/latest/manual/cmake.1.html
[cmake-buildsystem]: https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html
[license]: https://github.com/sergeyklay/cpp-project-templates/blob/master/LICENSE
