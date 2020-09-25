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

#include "ChuckNorrisImpl.hpp"

#include "Database.hpp"

stars::ChuckNorrisImpl::ChuckNorrisImpl() : dbMessage() {
  int flags = SQLITE_OPEN_URI | SQLITE_OPEN_READONLY;
  if (sqlite3_open_v2(STARS_DB_URI, &db, flags, nullptr) != SQLITE_OK) {
    dbStatus = -1;
    dbMessage = std::string(sqlite3_errmsg(db));
    sqlite3_close(db);
  } else {
    dbStatus = 1;
  }
}

stars::ChuckNorrisImpl::~ChuckNorrisImpl() {
  if (dbStatus == 1) {
    sqlite3_close(db);
  }
}

int stars::ChuckNorrisImpl::getDbStatus() const { return dbStatus; }

std::string stars::ChuckNorrisImpl::getDbMessage() const { return dbMessage; }

std::string stars::ChuckNorrisImpl::getFact() {
  std::string res;
  sqlite3_stmt* stmt;
  int rc;

  if (dbStatus != 1) {
    return res;
  }

  auto const q = R"(SELECT fact FROM chucknorris ORDER BY RANDOM() LIMIT 1;)";
  rc = sqlite3_prepare_v2(db, q, -1, &stmt, nullptr);

  if (rc != SQLITE_OK) {
    dbMessage = std::string(sqlite3_errmsg(db));
    dbStatus = -2;
  } else {
    rc = sqlite3_step(stmt);
    if (rc != SQLITE_ROW) {
      dbMessage = std::string(sqlite3_errmsg(db));
      dbStatus = -4;
      if (rc != SQLITE_DONE) {
        dbStatus = -3;
      }
    } else {
      auto sqlite_row = sqlite3_column_text(stmt, 0);
      auto row = reinterpret_cast<const char*>(sqlite_row);
      res = std::string(row);
    }
  }

  sqlite3_finalize(stmt);
  return res;
}
