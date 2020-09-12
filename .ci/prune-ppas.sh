#!/usr/bin/env bash
#
# This file is part of the Repository Templates for C++ Projects.
#
# (c) Serghei Iakovlev <egrep@protonmail.ch>
#
# For the full copyright and license information, please view
# the LICENSE file that was distributed with this source code.

declare -a sources=(
  'ansible*'
  'azure*'
  'bazel'
  '*libcontainers*'
  'google-chrome'
  'google-cloud-sdk'
  'heroku'
  'hvr-ubuntu-ghc-bionic'
  'kubernetes'
  'microsoft-prod'
  'mongodb*'
  'mono-official-stable'
  'ondrej-ubuntu-php*'
  'pgdg'
  'sbt'
  'yarn'
)

for i in "${sources[@]}"; do
  sudo rm -f "/etc/apt/sources.list.d/${i}.list"
  sudo rm -f "/etc/apt/sources.list.d/${i}.list.save"
done

ls -l /etc/apt/sources.list.d/
