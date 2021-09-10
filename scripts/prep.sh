#!/usr/bin/env bash

pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

# Clone Repo
rm -rf zammad
git clone https://github.com/zammad/zammad.git zammad

# Enter Repo
pushd zammad

# Checkout latest tagged version
LATEST_TAG=`git describe --tags $(git rev-list --tags --max-count=1)`
git checkout "${LATEST_TAG}"

# Apply Patches
git apply ../patches/*.patch

# Exit Repo
popd
