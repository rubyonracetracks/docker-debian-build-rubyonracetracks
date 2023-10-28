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
DIR_ROOT=`pwd`

update-bin-set-variables () {
  STRING1="$1"
  STRING2="$2"
  wget -O - \
    https://raw.githubusercontent.com/rubyonracetracks/docker-common/main/replace-string-in-file.sh \
    | bash -s "$STRING1" "$STRING2" 'tmp/bin/set-variables'
}

update-bin-set-variables '<ABBREV>' "$ABBREV"
update-bin-set-variables '<SUITE>' "$SUITE"
update-bin-set-variables '<OWNER>' "$OWNER"
update-bin-set-variables '<DISTRO>' "$DISTRO"
update-bin-set-variables '<DIR_ROOT>' "$DIR_ROOT"
