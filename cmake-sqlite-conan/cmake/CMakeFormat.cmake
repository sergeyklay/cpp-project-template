# Copyright (C) 2019 by George Cave - gcave@stablecoder.ca
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

find_program(CMAKE_FORMAT_EXE "cmake-format")
mark_as_advanced(FORCE CMAKE_FORMAT_EXE)

set(_base_message "Check for cmake-format")
if(CMAKE_FORMAT_EXE)
    message(STATUS "cmake-format found: ${CMAKE_FORMAT_EXE}")
else()
    message(STATUS "cmake-format not found!")
endif()

# When called, this function will call 'cmake-format' program on all listed
# files (if both the program and the files exist and are found)
# ~~~
# Required:
# TARGET_NAME - The name of the target to create.
#
# Optional:
# ARGN - Any  arguments passed in will be considered as 'files' to perform the
# formatting on. Any items that are not files will be ignored. Both relative and
# absolute paths are accepted.
# ~~~
function(cmake_format TARGET_NAME)
    if(CMAKE_FORMAT_EXE)
        set(FORMAT_FILES)
        # Determine files that exist
        foreach(iter IN LISTS ARGN)
            if(EXISTS ${iter})
                set(FORMAT_FILES ${FORMAT_FILES} ${iter})
            elseif(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${iter})
                set(FORMAT_FILES ${FORMAT_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/${iter})
            endif()
        endforeach()

        # Generate target
        if(FORMAT_FILES)
            if(TARGET ${TARGET_NAME})
                message(
                        ERROR
                        "Cannot create cmake-format target '${TARGET_NAME}', already exists.")
            else()
                add_custom_target(${TARGET_NAME} COMMAND ${CMAKE_FORMAT_EXE} -i
                        ${FORMAT_FILES})

                if(NOT TARGET cmake-format)
                    add_custom_target(cmake-format)
                endif()
                add_dependencies(cmake-format ${TARGET_NAME})
            endif()
        endif()
    endif()
endfunction()
