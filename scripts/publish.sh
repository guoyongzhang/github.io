#!/bin/bash

set -e
PUBLISH_BRANCH=gh-pages
RELEASE_BRANCH=$1
LATEST_VERSION=$2

function ensureRoot() {
    /usr/bin/gh-pages -b ${PUBLISH_BRANCH} -d hack -a
}

if [[ ${RELEASE_BRANCH} == release-* ]]; then
  VERSION=v${RELEASE_BRANCH:8}
  echo "publish ${VERSION}"
  /usr/bin/gh-pages -d production -b ${PUBLISH_BRANCH} -e "${VERSION}"
  if [[ "true" == "${LATEST_VERSION}" ]]; then
    echo "publish ${VERSION} as the latest"
    /usr/bin/gh-pages -d production -b ${PUBLISH_BRANCH} -e latest
  fi
  ensureRoot
elif [[ ${RELEASE_BRANCH} == master ]]; then
  echo "publish master as devel"
  /usr/bin/gh-pages -d production -b ${PUBLISH_BRANCH} -e devel
  ensureRoot
else
  echo "${RELEASE_BRANCH} is not a release branch.  Can not publish."
  exit 1
fi
