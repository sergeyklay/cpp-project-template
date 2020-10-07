# Copyright 2020 Serghei Iakovlev <egrep@protonmail.ch>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include(BuildType)

# Make sure developers do not run cmake in the main project directory,
# to keep build artifacts from becoming clutter
get_filename_component(srcdir "${CMAKE_SOURCE_DIR}" REALPATH)
get_filename_component(bindir "${CMAKE_BINARY_DIR}" REALPATH)

if("${srcdir}" STREQUAL "${bindir}")
  message(FATAL_ERROR
    "In-source builds not allowed. They are unsupportable in practice, they spill "
    "their guts into .gitignore, and they turn buildsystem bugs into damage to sources. "
    "Instead, build the project out-of source: Create a "
    "separate directory for the build *outside of the source folder*, and run "
    "cmake <path to the source dir> and build from there."
    "You may need to remove CMakeCache.txt.")
endif()

include(ProcessorCount)

ProcessorCount(N)
if(NOT N EQUAL 0)
  set(BUILD_JOBS ${N})
else()
  message(WARNING
    "There's a problem determining the processor count. Set fallback to: 2")
  set(BUILD_JOBS 2)
endif()

# When you create a shared library or DLL with the MSVC compiler, you
# have to tell it what symbols you want exported from the library.
# UNIX compilers default to exporting all symbols.  Windows defaults
# to NONE.   When you create a DLL, you get two files a <LIB>.dll and
# IF you have exports a <LIB>.lib.
#
# The following config will enable UNIX-like behavior in Windows and
# forces to export all symbols.
#
# For more see:
# https://cmake.org/cmake/help/latest/prop_tgt/WINDOWS_EXPORT_ALL_SYMBOLS.html
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

# Generate a "compile_commands.json" file containing the exact compiler
# calls for all translation units of the project in machine-readable form.
# This is useful  for all sorts of tools ("clang-tidy", "cppcheck", "oclint",
# "include-what-you-use", etc).
#
# Note This option is implemented only by Makefile Generators and the Ninja.
# It is ignored on other generators.
#
# For more see:
# https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
