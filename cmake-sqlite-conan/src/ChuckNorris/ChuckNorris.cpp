// This file is part of the Stars.
//
// (c) Serghei Iakovlev <egrep@protonmail.ch>
//
// For the full copyright and license information, please view
// the LICENSE file that was distributed with this source code.

#include <stars/ChuckNorris.hpp>

stars::ChuckNorris::ChuckNorris() = default;

stars::ChuckNorris::~ChuckNorris() = default;

std::string stars::ChuckNorris::getFact() {
  return "Chuck Norris can slam a revolving door.";
}
