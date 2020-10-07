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

include(CMakeDependentOption)

option(WARNINGS_AS_ERRORS "Turn all build warnings into errors")

add_library(compilerwarnings INTERFACE)
add_library(stars::CompilerWarnings ALIAS compilerwarnings)

# Clang / GCC
# For "-Werror" see target_compile_options() bellow
set(unix-warnings
  -Wall             # Baseline reasonable warnings
  -Wextra           # Reasonable and standard
  -Wpedantic        # Warn if non-standard C++ is used
  -Wshadow          # Warn if a variable declaration shadows one from a parent context
  -Wsign-conversion # Warn for implicit conversions that may change the sign of an integer value
  -Wswitch-enum)    # Warn whenever a "switch" lacks a "case"

# MSVC
# For "/WX" see target_compile_options() bellow
set(msvc-warnings
  /W4) # Baseline reasonable warnings

# This is recognized as a valid compiler flag only by GCC
if(CMAKE_COMPILER_IS_GNUCXX)
  # Warn for constructs that violate guidelines in Effective C++
  list(APPEND unix-warnings -Weffc++)
endif()

# Enable all flags
target_compile_options(
  compilerwarnings
  INTERFACE $<$<CXX_COMPILER_ID:MSVC>:${msvc-warnings}
            $<$<BOOL:${WARNINGS_AS_ERRORS}>:/WX>>
            $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:${unix-warnings}
            $<$<BOOL:${WARNINGS_AS_ERRORS}>:-Werror>>)

# Verify compiler flags
string(TOUPPER ${CMAKE_BUILD_TYPE} _build_type)
message(STATUS "Used compiler flags: ${CMAKE_CXX_FLAGS_${_build_type}}")
unset(_build_type)
