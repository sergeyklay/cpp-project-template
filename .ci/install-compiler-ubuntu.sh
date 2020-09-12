#!/usr/bin/env bash
#
# This file is part of the Repository Templates for C++ Projects.
#
# (c) Serghei Iakovlev <egrep@protonmail.ch>
#
# For the full copyright and license information, please view
# the LICENSE file that was distributed with this source code.

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
