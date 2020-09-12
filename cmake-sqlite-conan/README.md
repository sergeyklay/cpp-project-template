# Stars

A template project with with integrations of the following tools:
  
- [CMake][cmake]

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

If you're using Ubuntu, you can install the required packages this way:

```shell script
$ sudo apt install gcc cmake build-essential
```

On macOS you most likely have a compiler so you'll need only CMake:

```shell script
$ brew install cmake
```

Please note that specific versions of libraries and programs at the time of
reading this guide may vary. 

### Build

First you'll need clone the project:

```shell script
$ git clone https://github.com/sergeyklay/cpp-project-templates
$ cd cpp-project-templates/cmake-sqlite-conan
```

Finally configure and build project as follows:

```shell script
$ cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release
$ cmake --build build
```

### Further Reading

- [`cmake-buildsystem(7)`][cmake-buildsystem]

## License

This project is open source software licensed under the Apache License 2.0.
See the [LICENSE][license] file for more information.

[gcc]: https://gcc.gnu.org/
[clang]: https://clang.llvm.org/
[apple clang]: https://apps.apple.com/us/app/xcode/id497799835 
[cmake]: https://cmake.org/
[cmake-buildsystem]: https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html
[license]: https://github.com/sergeyklay/cpp-project-templates/blob/master/LICENSE
