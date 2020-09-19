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

# Demo
add_executable(stars)
target_sources(stars PRIVATE main.cpp)

target_include_directories(
  stars
  PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
  PRIVATE $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>)

target_link_libraries(
  stars
  PUBLIC chucknorris
  PRIVATE compilerwarnings)

file(RELATIVE_PATH _rel ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR}
     ${CMAKE_INSTALL_PREFIX})
if(APPLE)
  set(_rpath "@loader_path/${_rel}")
else()
  set(_rpath "\$ORIGIN/${_rel}")
endif()
file(TO_NATIVE_PATH "${_rpath}/${INSTALL_LIBDIR}" message_RPATH)

# cmake-format: off
set_target_properties(stars PROPERTIES
  VERSION ${STARS_VERSION}
  MACOSX_RPATH ON
  # Tells CMake to generate an appropriate RPATH so as to be
  # able to run the executable from within the build tree.
  SKIP_BUILD_RPATH OFF
  # Turns off generating executable targets with their
  # RPATH geared to be the same as the one for the install tree.
  # This would prevent us from running the executable from within
  # the build tree.
  BUILD_WITH_INSTALL_RPATH OFF
  # Sets the RPATH for the installed executable target to a path
  # previously computed.
  INSTALL_RPATH "${message_RPATH}"
  # Tells CMake to append linker search paths to
  # the RPATH executable.
  INSTALL_RPATH_USE_LINK_PATH ON)

install(TARGETS stars
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
# cmake-format: on
