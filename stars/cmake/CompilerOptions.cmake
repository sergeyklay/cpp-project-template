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

add_library(cppwarnings INTERFACE)

# Setup initial compiler flags to use on UNIX systems
set(unix-warnings -Wall -Wextra -pedantic -Wshadow -Wsign-conversion
                  -Wswitch-enum)

# This is recognized as a valid compiler flag only by gcc
if(CMAKE_COMPILER_IS_GNUCXX)
  list(APPEND unix-warnings -Weffc++)
endif()

target_compile_options(
  cppwarnings
  INTERFACE $<$<CXX_COMPILER_ID:MSVC>:/W4 $<$<BOOL:${WARNINGS_AS_ERRORS}>:/WX>>
            $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:${unix-warnings}
            $<$<BOOL:${WARNINGS_AS_ERRORS}>:-Werror>>)
