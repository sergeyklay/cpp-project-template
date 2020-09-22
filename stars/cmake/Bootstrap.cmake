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

set(allowableBuildTypes Debug Release RelWithDebInfo MinSizeRel)

# Specify the build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE
      Debug
      CACHE STRING
            "Specify the build type: Debug Release RelWithDebInfo MinSizeRel"
            FORCE)
elseif(NOT CMAKE_BUILD_TYPE IN_LIST allowableBuildTypes)
  message(FATAL_ERROR "Invalid build type: ${CMAKE_BUILD_TYPE}")
endif()

unset(allowableBuildTypes)

# Make sure developers do not run cmake in the main project directory, to keep
# build artifacts from becoming clutter
if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(
    FATAL_ERROR
      "In-source builds not allowed. Please make a new directory "
      "(called a build directory) and run CMake from there. "
      "You may need to remove CMakeCache.txt.")
endif()

include(ProcessorCount)

ProcessorCount(N)
if(NOT N EQUAL 0)
  set(BUILD_JOBS ${N})
else()
  message(
    WARNING
      "There's a problem determining the processor count. Set fallback to: 2")
  set(BUILD_JOBS 2)
endif()

# When you create a shared library or DLL with the MSVC compiler, you
# have to tell it what symbols you want exported from the library.
# UNIX compilers default to exporting all symbols.  Windows defaults
# to NONE.   When you create a DLL, you get two files a <LIB>.dll and
# IF you have exports a <LIB>.lib.
#
# The following config will enable UNIX-like behavior inWindows and
# forces to export all symbols.
#
# For more see:
# https://cmake.org/cmake/help/latest/prop_tgt/WINDOWS_EXPORT_ALL_SYMBOLS.html
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
