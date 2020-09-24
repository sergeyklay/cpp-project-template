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

include(GoogleTest)

file(GLOB CHUCKNORRIS_TESTS ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

add_executable(ChuckNorrisTest)
target_sources(ChuckNorrisTest
  PRIVATE ${PROJECT_TESTS_SOURCE_DIR}/main.cpp ${CHUCKNORRIS_TESTS})

target_include_directories(ChuckNorrisTest
  PUBLIC  $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
  PRIVATE $<BUILD_INTERFACE:${PROJECT_TESTS_SOURCE_DIR}>
          $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>
          $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)

target_link_libraries(ChuckNorrisTest
  PRIVATE Stars::CompilerWarnings
          Stars::ChuckNorris
          CONAN_PKG::gtest)

gtest_discover_tests(ChuckNorrisTest
  TEST_PREFIX Stars:
  PROPERTIES LABELS ChuckNorrisTest)

set_property(GLOBAL APPEND PROPERTY PROJECT_TESTS ChuckNorrisTest)
