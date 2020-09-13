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

declare -a sources=(
  'ansible-ubuntu-ansible-bionic'
  'azure-cli'
  'bazel'
  'devel:kubic:libcontainers:stable'
  'google-chrome'
  'google-cloud-sdk'
  'heroku'
  'hvr-ubuntu-ghc-bionic'
  'kubernetes'
  'microsoft-prod'
  'mongodb-org-4.4'
  'mono-official-stable'
  'ondrej-ubuntu-php-bionic'
  'pgdg'
  'sbt'
  'yarn'
)

for i in "${sources[@]}"; do
  sudo rm -f "/etc/apt/sources.list.d/${i}.list"
  sudo rm -f "/etc/apt/sources.list.d/${i}.list.save"
done

ls -l /etc/apt/sources.list.d/
