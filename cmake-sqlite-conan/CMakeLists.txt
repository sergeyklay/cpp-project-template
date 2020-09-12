# This file is part of the Stars.
#
# (c) Serghei Iakovlev <egrep@protonmail.ch>
#
# For the full copyright and license information, please view the LICENSE file
# that was distributed with this source code.

cmake_minimum_required(VERSION 3.14)

project(Stars LANGUAGES CXX)

# Determine if Stars is built as a subproject (using add_subdirectory) or if it
# is the master project.
set(MASTER_PROJECT OFF)
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
  set(MASTER_PROJECT ON)
  # Print the version number of CMake if this is the main project
  message(STATUS "CMake version: ${CMAKE_VERSION}")
endif()

# Provide path for additional CMake scripts
list(APPEND CMAKE_MODULE_PATH ${Stars_SOURCE_DIR}/../external/cmake-scripts)

include(formatting)

# Require C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Tools
file(GLOB_RECURSE glob_files #
     ${Stars_SOURCE_DIR}/include/*.[hc] ${Stars_SOURCE_DIR}/include/*.[hc]pp
     ${Stars_SOURCE_DIR}/src/*.[hc] ${Stars_SOURCE_DIR}/src/*.[hc]pp)
clang_format(cpp-format ${glob_files})

file(GLOB_RECURSE glob_files #
     "${Stars_SOURCE_DIR}/../cmake/*.cmake"
     "${Stars_SOURCE_DIR}/src/CMakeLists.txt")

list(APPEND glob_files ${Stars_SOURCE_DIR}/CMakeLists.txt
     ${Stars_SOURCE_DIR}/../external/CMakeLists.txt)
cmake_format(cmake-format "${glob_files}")

add_subdirectory(src)
