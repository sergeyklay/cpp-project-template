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

cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

project(Stars LANGUAGES CXX)

# Provide path for additional CMake scripts
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# Determine if Stars is built as a subproject (using add_subdirectory) or if it
# is the master project.
set(MASTER_PROJECT OFF)
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
  set(MASTER_PROJECT ON)
  # Print the version number of CMake if this is the main project
  message(STATUS "CMake version: ${CMAKE_VERSION}")
  message(STATUS "Used generator: ${CMAKE_GENERATOR}")
endif()

# CMake Script Includes
include(Bootstrap)
include(Helpers)
include(CompilerWarnings)
include(LanguageStandard)
include(Cppcheck)
include(ClangFormat)

file(GLOB_RECURSE cpp_files
  ${PROJECT_SOURCE_DIR}/include/*.[hc]
  ${PROJECT_SOURCE_DIR}/include/*.[hc]pp
  ${PROJECT_SOURCE_DIR}/src/*.[hc]
  ${PROJECT_SOURCE_DIR}/src/*.[hc]pp
  ${PROJECT_SOURCE_DIR}/tests/*.[hc]
  ${PROJECT_SOURCE_DIR}/tests/*.[hc]pp)

clang_format(cpp-format ${cpp_files})

# Conan helpers
include(ConanHelper)

# Project specific variables
include(ProjectInfo)

# Use a standard directory layout
include(GNUInstallDirs)

add_subdirectory(src)
add_subdirectory(data)

option(WITH_TESTS "Enable testing support" OFF)
if(MASTER_PROJECT)
  include(CTest)

  if(BUILD_TESTING AND WITH_TESTS)
    add_subdirectory(tests)
  endif()
endif()
