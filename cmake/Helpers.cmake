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

# Prints a list of messages, each one in a new line
#
# Usage:
#     file(GLOB_RECURSE cmake_files
#       ${PROJECT_SOURCE_DIR}/cmake/*.cmake
#       ${PROJECT_SOURCE_DIR}/src/CMakeLists.txt)
#
#     print_list(${config_files})
function(print_list)
  foreach(msg ${ARGV})
    message("${msg}")
  endforeach()
endfunction()
