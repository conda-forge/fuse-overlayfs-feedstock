#!/usr/bin/env bash

set -euxo pipefail

# Check that version tag is up to date (got out of sync upstream).
grep -m1 '^AC_INIT' configure.ac \
  | grep -qE "$( printf %s "${PKG_VERSION}" | sed -E 's/(\.0)+/(\1)*/ ; s/\./\\./g' )"

./autogen.sh
./configure --prefix="${PREFIX}"
make
make install
