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

#include <sqlite3.h>

#include <stars/ChuckNorris.hpp>

stars::ChuckNorris::ChuckNorris() = default;

stars::ChuckNorris::~ChuckNorris() {
  // Closing a database connection
  sqlite3_close(db);
}

std::string stars::ChuckNorris::getFact() {
  sqlite3_stmt* stmt;
  int rc;
  std::string res;
  auto const q = R"(SELECT fact FROM chucknorris ORDER BY RANDOM() LIMIT 1;)";

  rc = sqlite3_prepare_v2(db, q, -1, &stmt, nullptr);
  if (rc != SQLITE_OK) {
    // Something went wrong.
    // TODO(serghei): Log me.
  }

  rc = sqlite3_step(stmt);
  if (rc != SQLITE_ROW) {
    // Something went wrong.
    // TODO(serghei): Log me.
  }

  auto sqlite_row = sqlite3_column_text(stmt, 0);
  if (sqlite_row != nullptr) {
    auto row = reinterpret_cast<const char*>(sqlite_row);
    res = std::string(row);
  } else {
    res = "Nothing to say. Database is empty :(";
  }

  sqlite3_finalize(stmt);

  return res;
}
