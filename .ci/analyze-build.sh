#!/usr/bin/env bash
#
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

if [ "$2" = "Mach-O" ]; then
  echo
  echo "Executable"
  echo

  file "build/bin/$1"
  otool -L "build/bin/$1"
  otool -hv "build/bin/$2"

  echo
  echo "Libraries"
  echo

  # shellcheck disable=SC2066
  # shellcheck disable=SC2010
  for f in "$(ls -gG build/lib/ | grep '^-' | awk '{print $NF}')"; do
    file "build/lib/$f"
    otool -L "build/lib/$f"
    otool -hv "build/lib/$f"
  done
elif [ "$2" = "ELF" ]; then
  echo
  echo "Executable"
  echo

  file "build/bin/$1"
  ldd "build/bin/$1"
  readelf --program-headers --wide "build/bin/$2"

  echo
  echo "Libraries"
  echo

  # shellcheck disable=SC2066
  # shellcheck disable=SC2010
  for f in "$(ls -gG build/lib/ | grep '^-' | awk '{print $NF}')"; do
    file "build/lib/$f"
    ldd "build/lib/$f"
    readelf --program-headers --wide "build/lib/$f"
  done
else
  echo "Possible object file format are: \"Mach-O\", \"ELF\"" 1>&2
  echo "Got: \"$2\"" 1>&2
  exit 1
fi
