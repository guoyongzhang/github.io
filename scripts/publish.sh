#!/bin/bash

VERSION=${1:-"latest"}
echo "publishing $VERSION"

hugo --source . --environment production --destination production
gh-pages -b gh-pages -d production -e $VERSION
