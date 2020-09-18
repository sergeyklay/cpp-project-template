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

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters" 1>&2
    echo "Usage: analyze-build.sh <PROJECT_NAME>" 1>&2
fi

echo "==========================================="
echo "Executable"
echo "==========================================="
echo

objtype="ELF"
ftype="$(file "build/bin/$1")"
echo "$ftype"

if [[ "$ftype" =~ .*"Mach-O".* ]]; then
  objtype="Mach-"
fi

if [ "$objtype" = "Mach-O" ]; then
  otool -L "build/bin/$1"
  otool -hv "build/bin/$1"
else
  ldd "build/bin/$1"
  readelf --program-headers --wide "build/bin/$1"
fi

echo "==========================================="
echo "Libraries"
echo "==========================================="
echo

# shellcheck disable=SC2066
# shellcheck disable=SC2010
for f in "$(ls -gG build/lib/ | grep '^-' | awk '{print $NF}')"; do
  file "build/lib/$f"

  if [ "$objtype" = "Mach-O" ]; then
    otool -L "build/lib/$f"
    otool -hv "build/lib/$f"
  else
    ldd "build/lib/$f"
    readelf --program-headers --wide "build/lib/$f"
  fi
done
