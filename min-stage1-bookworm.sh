#!/bin/bash

# NOTE: set -o pipefail is needed to ensure that any error or failure causes the whole pipeline to fail.
# Without this specification, the CI status will provide a false sense of security by showing builds
# as succeeding in spite of errors or failures.
set -eo pipefail

rm -rf tmp

mkdir -p tmp/bin
cp bin/set-variables tmp/bin

ABBREV='min-stage1'
SUITE='bookworm'
OWNER='rubyonracetracks'
DISTRO='debian'

bin/update-set-variables "$ABBREV" "$OWNER" "$SUITE" "$DISTRO"
bin/setup-work-dir
