#! /usr/bin/env bash

trap 'rm -rf "$TMPDIR"' EXIT

set -e

TMPDIR=$(mktemp -d) || exit 1
REVISION=$(jq -r '.nodes["offen-src"].locked.rev' flake.lock)
OUTPUT_DIR=$(pwd)/

# Clone repository
git clone git@github.com:offen/offen.git $TMPDIR


# Create each set of .nix files for a JS build
function createNixFiles {
    package=$1

    pushd $TMPDIR/$package
    node2nix \
        --lock package-lock.json \
        --development \
        --no-copy-node-env \
        --output node-packages.nix \
        --composition composition.nix
    mkdir -p $OUTPUT_DIR/pkgs/offen-$package/
    cp node-packages.nix $OUTPUT_DIR/pkgs/offen-$package/
    popd
}

# Run this in all JS build directories
pushd $TMPDIR

git checkout $REVISION

createNixFiles "auditorium"
createNixFiles "vault"
createNixFiles "script"
createNixFiles "packages"

popd

# Patch the relevant files
patch -p0 -i patches/node2nix-generated-files.diff
