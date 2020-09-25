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

#ifndef STARS_CHUCKNORRIS_CHUCKNORRISIMPL_HPP_
#define STARS_CHUCKNORRIS_CHUCKNORRISIMPL_HPP_

#include <sqlite3.h>

#include <string>

namespace stars {
class ChuckNorrisImpl {
 public:
  ChuckNorrisImpl();
  ~ChuckNorrisImpl();

  // Make sure you cannot copy Chuck Norris Implementation
  ChuckNorrisImpl(ChuckNorrisImpl const &) = delete;
  ChuckNorrisImpl &operator=(ChuckNorrisImpl const &) = delete;

  // Make sure you cannot move Chuck Norris Implementation
  ChuckNorrisImpl(ChuckNorrisImpl &&) = delete;
  ChuckNorrisImpl &operator=(ChuckNorrisImpl &&) = delete;

  std::string getFact();

  [[nodiscard]] int getDbStatus() const;
  [[nodiscard]] std::string getDbMessage() const;

 private:
  sqlite3 *db = nullptr;
  std::string dbMessage;
  int dbStatus = 0;
};
}  // namespace stars

#endif  // STARS_CHUCKNORRIS_CHUCKNORRISIMPL_HPP_
