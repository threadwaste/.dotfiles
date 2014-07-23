#! /bin/bash

set -e

cd "$(dirname "$0")"

rsync \
  --exclude ".git/" --exclude ".gitignore" --exclude ".gitmodules" \
  --exclude "deploy.sh" --exclude "README.textile" \
  -av . ~
