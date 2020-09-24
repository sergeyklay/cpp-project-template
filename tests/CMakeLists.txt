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

define_property(
  GLOBAL
  PROPERTY PROJECT_TESTS
  BRIEF_DOCS "All project tests"
  FULL_DOCS "The full list of all project tests")

set(PROJECT_TESTS_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# Global tests properties
configure_file(Properties.hpp.in "${CMAKE_CURRENT_SOURCE_DIR}/Properties.hpp")

add_subdirectory(ChuckNorris)

get_property(PROJECT_TESTS GLOBAL PROPERTY PROJECT_TESTS)
add_custom_target(
  check
  COMMAND ctest --output-on-failure
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
  DEPENDS ${PROJECT_TESTS}
  COMMENT "Run all tests...")
