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

if [ "$1" = "gcc" ]; then
  sudo apt-get install --no-install-recommends -q -y "gcc-${2}"

  echo "::set-env name=CC::gcc-${2}"
  echo "::set-env name=CXX::g++-${2}"
else
  sudo apt-get install --no-install-recommends -q -y "clang-${2}" "llvm-${2}"
  sudo update-alternatives --install /usr/bin/llvm-cov llvm-cov \
    "/usr/bin/llvm-cov-${2}" 90

  echo "::set-env name=CC::clang-${2}"
  echo "::set-env name=CXX::clang++-${2}"
fi
