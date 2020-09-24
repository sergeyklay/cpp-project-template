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

# Database configuration

# We have to append an extra slash to URI in case of Windows builds.
# This is needed because the following URI is invalid:
#     file://c:/project/db/project.db
# But this one is valid:
#     file:///c:/project/db/project.db
string(REGEX MATCH "^[A-Z]:.+$" drive_match "${CMAKE_INSTALL_PREFIX}")
if (NOT "${drive_match}" STREQUAL "")
  set(DB_INSTALL_PREFIX "/${CMAKE_INSTALL_PREFIX}")
else ()
  set(DB_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")
endif ()

set(input ${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt)
get_filename_component(_MOD_DIR ${input} DIRECTORY)
configure_file("${_MOD_DIR}/Database.hpp.in" "${_MOD_DIR}/Database.hpp")

# Add definition for chucknorris library
add_library(chucknorris SHARED ChuckNorris.cpp)
add_library(Stars::ChuckNorris ALIAS chucknorris)

target_link_libraries(chucknorris
  PUBLIC  CONAN_PKG::sqlite3 CONAN_PKG::spdlog
  PRIVATE Stars::CompilerWarnings)

target_include_directories(chucknorris
  PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

# Version info
set(CHUCKNORRIS_VERSION_MAJOR 1)
set(CHUCKNORRIS_VERSION_MINOR 13)
set(CHUCKNORRIS_VERSION_PATCH 42)

set(CHUCKNORRIS_VERSION_STRING
    ${CHUCKNORRIS_VERSION_MAJOR}.${CHUCKNORRIS_VERSION_MINOR}.${CHUCKNORRIS_VERSION_PATCH})

# The SOVERSION is not necessarily the same as the major version. The rule is
# that any breakage of the ABI must be indicated by incrementing the SOVERSION.
# So, adding e.g. functions is no problem, modifying argument lists or removing
# functions would required the SOVERSION to be incremented. Similar rules hold
# of course for non-opaque data-structures.
set_target_properties(chucknorris PROPERTIES
  VERSION   ${CHUCKNORRIS_VERSION_STRING}
  SOVERSION ${CHUCKNORRIS_VERSION_MAJOR})

# CMake treats shared libraries as runtime objects on "DLL platforms"
# like Windows. Thus RUNTIME DESTINATION is required here.
install(TARGETS chucknorris
  LIBRARY  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  RUNTIME  DESTINATION ${CMAKE_INSTALL_BINDIR})
