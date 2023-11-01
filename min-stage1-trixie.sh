#!/bin/bash

# NOTE: set -o pipefail is needed to ensure that any error or failure causes the whole pipeline to fail.
# Without this specification, the CI status will provide a false sense of security by showing builds
# as succeeding in spite of errors or failures.
set -eo pipefail

ABBREV='min-stage1'
SUITE='trixie'
DISTRO='debian'
OWNER='rubyonracetracks'

rm -rf tmp

bin/build "$ABBREV" "$SUITE" "$DISTRO" "$OWNER"