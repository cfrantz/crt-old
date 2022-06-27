#!/usr/bin/env bash

set -euo pipefail

ARTIFACTS=(@@ARTIFACTS@@)
GH=@@GH@@

LATEST_TAG=$(cd "$BUILD_WORKSPACE_DIRECTORY" && git describe --abbrev=0 --tags)

if $(${GH} release list | egrep -q "\s${LATEST_TAG}\s"); then
    echo "A release with tag ${LATEST_TAG} already exists."
    echo
    echo "To make a new release, create a new tag first."
    exit 1
fi

${GH} release create "$@" ${LATEST_TAG} ${ARTIFACTS[@]} 
