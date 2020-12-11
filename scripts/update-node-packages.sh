#! /usr/bin/env bash

trap 'rm -rf "$TMPDIR"' EXIT

set -e

TMPDIR=$(mktemp -d) || exit 1
REVISION=$(jq -r '.nodes["offen-src"].locked.rev' flake.lock)
OUTPUT_DIR=$(pwd)/pkgs/offen-auditorium/

# Clone repository
git clone git@github.com:offen/offen.git $TMPDIR


pushd $TMPDIR

git checkout $REVISION

pushd $TMPDIR/auditorium

node2nix \
    --lock package-lock.json \
    --development \
    --no-copy-node-env \
    --output node-packages.nix \
    --composition composition.nix

cp composition.nix $OUTPUT_DIR/
cp node-packages.nix $OUTPUT_DIR/

popd

popd

patch -p0 -i patches/node2nix-generated-files.diff
