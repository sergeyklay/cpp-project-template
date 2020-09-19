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

if(UNIX)
    find_program(
            SQLITE3_EXE
            NAMES sqlite3
            PATHS /usr /usr/local
            PATH_SUFFIXES bin)
elseif(WIN32)
    find_program(
            SQLITE3_EXE
            NAMES sqlite3.exe
            PATHS C:/
            PATH_SUFFIXES "")
endif()

mark_as_advanced(SQLITE3_EXE)

if(SQLITE3_EXE)
    get_filename_component(_DB_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)

    execute_process(
            COMMAND ${SQLITE3_EXE} ${_DB_DIR}/stars.db ".read ${_DB_DIR}/stars.sqlite"
            RESULT_VARIABLE SQLITE3_RESULT
            ERROR_VARIABLE SQLITE3_ERROR)

    if(SQLITE3_RESULT)
        message(FATAL_ERROR "${SQLITE3_ERROR}")
    else()
        install(FILES stars.db
                DESTINATION ${CMAKE_INSTALL_LOCALSTATEDIR}/db/stars)
    endif()
else()
    message(SEND_ERROR "sqlite3 executable not found!")
endif()
