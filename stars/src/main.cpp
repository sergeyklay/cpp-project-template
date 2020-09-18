// Copyright 2020 Serghei Iakovlev <egrep@protonmail.ch>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <iostream>
#include <string>

#include <stars/ChuckNorris.hpp>
#include <stars/Version.hpp>

int main() {
  stars::ChuckNorris chuckNorris;

  std::string const fact = chuckNorris.getFact();

  std::cout << STARS_VERSION_FULL << " (built: " << STARS_PACKAGE_BUILD_DATE
            << ") " << std::endl;
  std::cout << "Copyright " << STARS_COPYRIGHT << " (" << STARS_PACKAGE_URL
            << ")" << std::endl
            << std::endl;

  if (chuckNorris.getStatus() == 1) {
    std::cout << fact << std::endl;

    return 0;
  }

  return 1;
}
