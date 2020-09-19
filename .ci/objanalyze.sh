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
  echo "Usage: objanalyze.sh <PROJECT_NAME> [ PREFIX ]" 1>&2
fi

if [ "x$2" != "x" ]; then
  prefix="$2"
else
  prefix="$(pwd)/build"
fi

echo "==========================================="
echo "Executable"
echo "==========================================="
echo

ftype="$(file "${prefix}/bin/${1}")"
echo "$ftype"

if [[ "$ftype" =~ .*"Mach-O".* ]]; then
  otool -L "${prefix}/bin/${1}"
  otool -hv "${prefix}/bin/${1}"
else
  ldd "${prefix}/bin/${1}"
  readelf --program-headers --wide "${prefix}/bin/${1}"
fi

echo "==========================================="
echo "Libraries"
echo "==========================================="
echo

# shellcheck disable=SC2066
# shellcheck disable=SC2010
for f in "$(ls -gG "${prefix}/lib/" | grep '^-' | awk '{print $NF}')"; do
  file "${prefix}/lib/${f}"

  if [[ "$ftype" =~ .*"Mach-O".* ]]; then
    otool -L "${prefix}/lib/${f}"
    otool -hv "${prefix}/lib/${f}"
  else
    ldd "${prefix}/lib/${f}"
    readelf --program-headers --wide "${prefix}/lib/${f}"
  fi
done
