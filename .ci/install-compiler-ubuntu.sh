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

  if [ ! -f "/usr/bin/gcc-${2}" ] || [ ! -f "/usr/bin/g++-${2}" ]; then
    echo "No such version gcc/g++ installed" 1>&2
    exit 1
  fi

  sudo update-alternatives --remove-all gcc || true
  sudo update-alternatives --install /usr/bin/gcc gcc "/usr/bin/gcc-${2}" 90
  sudo update-alternatives --set gcc "/usr/bin/gcc-${2}"

  sudo update-alternatives --remove-all cc || true
  sudo update-alternatives --install /usr/bin/cc cc "/usr/bin/gcc-${2}" 90
  sudo update-alternatives --set cc "/usr/bin/gcc-${2}"

  sudo update-alternatives --remove-all g++ || true
  sudo update-alternatives --install /usr/bin/g++ g++ "/usr/bin/g++-${2}" 90
  sudo update-alternatives --set g++ "/usr/bin/g++-${2}"

  sudo update-alternatives --remove-all c++ || true
  sudo update-alternatives --install /usr/bin/c++ c++ "/usr/bin/g++-${2}" 90
  sudo update-alternatives --set c++ "/usr/bin/g++-${2}"

  echo "CC=gcc" >> "$GITHUB_PATH"
  echo "CXX=g++" >> "$GITHUB_PATH"
else
  sudo apt-get install --no-install-recommends -q -y "clang-${2}" "llvm-${2}"

  if [ ! -f "/usr/bin/clang-${2}" ] || [ ! -f "/usr/bin/clang++-${2}" ]; then
    echo "No such version clang/clang++ installed" 1>&2
    exit 1
  fi

  sudo update-alternatives --remove-all clang || true
  sudo update-alternatives --install /usr/bin/clang clang "/usr/bin/clang-${2}" 90
  sudo update-alternatives --set clang "/usr/bin/clang-${2}"

  sudo update-alternatives --remove-all cc || true
  sudo update-alternatives --install /usr/bin/cc cc "/usr/bin/clang-${2}" 90
  sudo update-alternatives --set cc "/usr/bin/clang-${2}"

  sudo update-alternatives --remove-all clang++ || true
  sudo update-alternatives --install /usr/bin/clang++ clang++ "/usr/bin/clang++-${2}" 90
  sudo update-alternatives --set clang++ "/usr/bin/clang++-${2}"

  sudo update-alternatives --remove-all c++ || true
  sudo update-alternatives --install /usr/bin/c++ c++ "/usr/bin/clang++-${2}" 90
  sudo update-alternatives --set c++ "/usr/bin/clang++-${2}"

  sudo update-alternatives --install /usr/bin/llvm-cov llvm-cov \
    "/usr/bin/llvm-cov-${2}" 90

  echo "CC=clang" >> "$GITHUB_PATH"
  echo "CXX=clang++" >> "$GITHUB_PATH"
fi
