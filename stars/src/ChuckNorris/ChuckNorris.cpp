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

#include "Database.hpp"

stars::ChuckNorris::ChuckNorris() {
  auto database =
      "file://" + std::string(STARS_DB_PATH) + "/" + std::string(STARS_DB_NAME);

  if (sqlite3_open_v2(database.c_str(), &db,
                      SQLITE_OPEN_URI | SQLITE_OPEN_READONLY,
                      nullptr) != SQLITE_OK) {
    // TODO(serghei): Unable to open database. Log me.
    sqlite3_close(db);
  } else {
    dbStatus = 1;
  }
}

stars::ChuckNorris::~ChuckNorris() {
  if (dbStatus == 1) {
    // Closing a database connection
    sqlite3_close(db);
  }
}

std::string stars::ChuckNorris::getFact() {
  if (dbStatus != 1) {
    // TODO(serghei): Log me.
    return "";
  }

  sqlite3_stmt* stmt;
  int rc;
  std::string res;
  auto const q = R"(SELECT fact FROM chucknorris ORDER BY RANDOM() LIMIT 1;)";

  rc = sqlite3_prepare_v2(db, q, -1, &stmt, nullptr);
  if (rc != SQLITE_OK) {
    // TODO(serghei): Something went wrong. Log me.
    return "";
  }

  rc = sqlite3_step(stmt);
  if (rc != SQLITE_ROW) {
    // TODO(serghei): Something went wrong. Log me.
    return "";
  }

  auto sqlite_row = sqlite3_column_text(stmt, 0);
  if (sqlite_row != nullptr) {
    auto row = reinterpret_cast<const char*>(sqlite_row);
    res = std::string(row);
  } else {
    // Nothing to say. Database is empty
    res = "";
  }

  sqlite3_finalize(stmt);

  return res;
}
