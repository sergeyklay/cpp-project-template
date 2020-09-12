// This file is part of the Stars.
//
// (c) Serghei Iakovlev <egrep@protonmail.ch>
//
// For the full copyright and license information, please view
// the LICENSE file that was distributed with this source code.

#include <iostream>
#include <string>

#include <stars/ChuckNorris.hpp>

int main() {
  stars::ChuckNorris chuckNorris;

  std::string const fact = chuckNorris.getFact();
  std::cout << fact << std::endl;

  return 0;
}
