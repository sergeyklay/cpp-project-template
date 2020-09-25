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

#include "stars/ChuckNorris.hpp"

#include <spdlog/spdlog.h>

#include "ChuckNorrisImpl.hpp"

stars::ChuckNorris::ChuckNorris() : pimpl(new stars::ChuckNorrisImpl) {
  if (getStatus() == -1) {
    spdlog::error("Can't open database: {}", pimpl->getDbMessage());
  }
}

int stars::ChuckNorris::getStatus() const { return pimpl->getDbStatus(); }

std::string stars::ChuckNorris::getFact() {
  auto fact = pimpl->getFact();
  auto stat = getStatus();

  if (stat < 0) {
    auto message = pimpl->getDbMessage();
    switch (getStatus()) {
      case -2:
        spdlog::error("Failed to prepare database query: {}", message);
        break;
      case -3:
        spdlog::error("Failed to select fact: {}", message);
        break;
      case -4:
        spdlog::error("Unable to select fact: database is empty");
        break;
      default:
        spdlog::error("Something went wrong");
    }
  }

  return fact;
}
