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

option(CPPCHECK "Turns on cppcheck processing if it is found." OFF)

# Adds cppcheck to the compilation, with the given arguments being used as the
# options set.

if(UNIX)
  find_program(
    CPPCHECK_BIN
    NAMES cppcheck
    PATHS /opt/local /opt /usr/local /usr
    PATH_SUFFIXES bin)
elseif(WIN32)
  find_program(
    CPPCHECK_BIN
    NAMES cppcheck.exe
    PATHS C:/
    PATH_SUFFIXES "")
endif()

mark_as_advanced(CPPCHECK_BIN)

set(_base_message "Check for cppcheck")
if(CPPCHECK_BIN)
  # Version number checking for '-std=c++17' compatibility
  execute_process(
    COMMAND ${CPPCHECK_BIN} --version
    OUTPUT_VARIABLE CPPCHECK_VERSION_CALL_OUTPUT
    RESULT_VARIABLE CPPCHECK_VERSION_RESULT
    ERROR_VARIABLE CPPCHECK_VERSION_ERROR
    OUTPUT_STRIP_TRAILING_WHITESPACE)

  if(CPPCHECK_VERSION_RESULT)
    string(CONCAT CPPCHECK_FIND_ERROR
                  "Command \"${CPPCHECK_BIN} --version\" failed "
                  "with output:\n${CPPCHECK_VERSION_ERROR}")

    message(FATAL_ERROR "${CPPCHECK_FIND_ERROR}")
  endif()

  string(REGEX MATCH "[0-9]+\\.[0-9]+" CPPCHECK_VERSION
               ${CPPCHECK_VERSION_CALL_OUTPUT})

  if(CPPCHECK_VERSION VERSION_LESS "1.89")
    message(
      SEND_ERROR
        "Cppcheck ${CPPCHECK_VERSION} require option --std=c++17 which is available on cppcheck >= 1.89"
    )
  endif()

  message(STATUS "${_base_message}: ${CPPCHECK_BIN}")
  if(CPPCHECK)
    set(CMAKE_CXX_CPPCHECK
        "${CPPCHECK_BIN}"
        "--enable=warning,performance,portability,missingInclude"
        "--language=c++"
        "--std=c++17"
        "--template={file}:{line}:{column}:\ {severity}:\ {message}\ [--suppress={id}]\\n{code}"
        "--inline-suppr"
        "--suppressions-list=${CMAKE_SOURCE_DIR}/cppcheck.supp"
        "-j${BUILD_JOBS}"
        "--quiet"
        "--verbose"
        "--force")
  endif()

elseif(CPPCHECK)
  message(SEND_ERROR "${_base_message}: executable not found!")
  set(CMAKE_CXX_CPPCHECK
      ""
      CACHE STRING "" FORCE) # delete it
else()
  message(STATUS "${_base_message}: not found")
  set(CMAKE_CXX_CPPCHECK
      ""
      CACHE STRING "" FORCE) # delete it
endif()
unset(_base_message)
