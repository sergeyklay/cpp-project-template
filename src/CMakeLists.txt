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

# Stars libraries
add_subdirectory(ChuckNorris)

# Demo app
add_executable(stars)
target_sources(stars PRIVATE main.cpp)

target_include_directories(stars
  PUBLIC  $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
          $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
  PRIVATE $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>)

target_link_libraries(stars
  PRIVATE compilerwarnings chucknorris)

file(RELATIVE_PATH _rel
  ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR}
  ${CMAKE_INSTALL_PREFIX})

if(APPLE)
  set(_rpath "@loader_path/${_rel}")
else()
  set(_rpath "\$ORIGIN/${_rel}")
endif()

file(TO_NATIVE_PATH
  "${_rpath}/${CMAKE_INSTALL_LIBDIR}"
  message_RPATH)

set_target_properties(stars PROPERTIES
  VERSION ${PROJECT_VERSION}
  MACOSX_RPATH ON
  # Don't skip the full RPATH for the build tree.
  SKIP_BUILD_RPATH OFF
  # When building, don't use the install RPATH already.
  BUILD_WITH_INSTALL_RPATH OFF
  # The RPATH to be used when installing.
  INSTALL_RPATH "${message_RPATH}"
  # Tells CMake to append linker search paths to
  # the RPATH executable.
  INSTALL_RPATH_USE_LINK_PATH ON)

install(TARGETS stars
  RUNTIME  DESTINATION ${CMAKE_INSTALL_BINDIR}
  ARCHIVE  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
