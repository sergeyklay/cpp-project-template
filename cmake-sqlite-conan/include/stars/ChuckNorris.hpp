// This file is part of the Stars.
//
// (c) Serghei Iakovlev <egrep@protonmail.ch>
//
// For the full copyright and license information, please view
// the LICENSE file that was distributed with this source code.

/// \file ChuckNorris.hpp
/// \brief Provides simple interface to interact with Chuck Norris.

#ifndef STARS_CHUCKNORRIS_HPP_
#define STARS_CHUCKNORRIS_HPP_

#include <string>

namespace stars {

/// \brief Chuck Norris class.
class ChuckNorris {
 public:
  ChuckNorris();
  ~ChuckNorris();

  // Make sure you cannot copy Chuck Norris
  ChuckNorris(ChuckNorris const &) = delete;
  ChuckNorris(ChuckNorris &&) = delete;
  ChuckNorris &operator=(ChuckNorris const &) = delete;
  ChuckNorris &operator=(ChuckNorris &&) = delete;

  std::string getFact();
};
}  // namespace stars

#endif  // STARS_CHUCKNORRIS_HPP_
