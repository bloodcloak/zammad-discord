#!/usr/bin/env bash

pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

pushd zammad
echo `git describe --tags --abbrev=0`
popd
