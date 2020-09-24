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

if(NOT DEFINED PROJECT_VERSION_MAJOR)
  set(PROJECT_VERSION_MAJOR 1)
endif()

if(NOT DEFINED PROJECT_VERSION_MINOR)
  set(PROJECT_VERSION_MINOR 0)
endif()

if(NOT DEFINED PROJECT_VERSION_PATCH)
  set(PROJECT_VERSION_PATCH 0)
endif()

if(NOT DEFINED PROJECT_VERSION_SUFFIX)
  set(PROJECT_VERSION_SUFFIX git)
endif()

set(PROJECT_VERSION_WITHOUT_TWEAK
    ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH})

if(DEFINED PROJECT_VERSION_TWEAK AND PROJECT_VERSION_TWEAK)
  set(PROJECT_VERSION ${PROJECT_VERSION_WITHOUT_TWEAK}.${PROJECT_VERSION_TWEAK})
else()
  set(PROJECT_VERSION ${PROJECT_VERSION_WITHOUT_TWEAK})
endif()

set(PROJECT_PACKAGE_STRING "${PROJECT_VERSION}-${PROJECT_VERSION_SUFFIX}")
set(PROJECT_PACKAGE_URL "https://serghei.blog")

math(EXPR PROJECT_VERSION_ID
  ${PROJECT_VERSION_MAJOR}*10000+${PROJECT_VERSION_MINOR}*100+${PROJECT_VERSION_PATCH})

set(PROJECT_PACKAGE_NAME stars)
set(PROJECT_VERSION_FULL "${PROJECT_PACKAGE_NAME} ${PROJECT_PACKAGE_STRING}")

string(TIMESTAMP CURRENT_YEAR %Y)
string(TIMESTAMP CURRENT_DATE_TIME "%Y-%m-%d %H:%M:%S")

set(PROJECT_TEAM "Serghei Iakovlev")
set(PROJECT_COPYRIGHT "(c) 2019-${CURRENT_YEAR} ${PROJECT_TEAM}")
set(PROJECT_PACKAGE_BUILD_DATE "${CURRENT_DATE_TIME}")

set(PROJECT_DESCRIPTION "A small C++ template program")

configure_file("${PROJECT_SOURCE_DIR}/include/stars/Version.hpp.in"
               "${PROJECT_SOURCE_DIR}/include/stars/Version.hpp")

unset(CURRENT_YEAR)
unset(CURRENT_DATE_TIME)
unset(PROJECT_VERSION_WITHOUT_TWEAK)
