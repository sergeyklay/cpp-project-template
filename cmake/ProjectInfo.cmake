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

if(NOT DEFINED STARS_VERSION_MAJOR)
  set(STARS_VERSION_MAJOR 1)
endif()

if(NOT DEFINED STARS_VERSION_MINOR)
  set(STARS_VERSION_MINOR 0)
endif()

if(NOT DEFINED STARS_VERSION_PATCH)
  set(STARS_VERSION_PATCH 0)
endif()

if(NOT DEFINED STARS_VERSION_SUFFIX)
  set(STARS_VERSION_SUFFIX source)
endif()

set(PROJECT_VERSION_WITHOUT_TWEAK
    ${STARS_VERSION_MAJOR}.${STARS_VERSION_MINOR}.${STARS_VERSION_PATCH})

if(DEFINED STARS_VERSION_TWEAK AND STARS_VERSION_TWEAK)
  set(STARS_VERSION ${PROJECT_VERSION_WITHOUT_TWEAK}.${STARS_VERSION_TWEAK})
else()
  set(STARS_VERSION ${PROJECT_VERSION_WITHOUT_TWEAK})
endif()

set(STARS_PACKAGE_STRING "${STARS_VERSION}-${STARS_VERSION_SUFFIX}")
set(STARS_PACKAGE_URL "https://serghei.blog")

math(
  EXPR STARS_VERSION_ID
  ${STARS_VERSION_MAJOR}*10000+${STARS_VERSION_MINOR}*100+${STARS_VERSION_PATCH}
)

set(STARS_PACKAGE_NAME stars)
set(STARS_VERSION_FULL "${STARS_PACKAGE_NAME} ${STARS_PACKAGE_STRING}")

string(TIMESTAMP CURRENT_YEAR %Y)
string(TIMESTAMP CURRENT_DATE_TIME "%Y-%m-%d %H:%M:%S")

set(STARS_TEAM "Serghei Iakovlev")
set(STARS_COPYRIGHT "(c) 2019-${CURRENT_YEAR} ${STARS_TEAM}")
set(STARS_PACKAGE_BUILD_DATE "${CURRENT_DATE_TIME}")

set(PROJECT_VERSION ${STARS_VERSION})
set(PROJECT_DESCRIPTION "A small C++ template program")

set(input ${Stars_SOURCE_DIR}/cmake/ProjectInfo.cmake)
get_filename_component(_MOD_DIR ${input} DIRECTORY)

configure_file("${_MOD_DIR}/Version.hpp.in"
               "${Stars_SOURCE_DIR}/include/stars/Version.hpp")

unset(CURRENT_YEAR)
unset(CURRENT_DATE_TIME)
unset(PROJECT_VERSION_WITHOUT_TWEAK)
