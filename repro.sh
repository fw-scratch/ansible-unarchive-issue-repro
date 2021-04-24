#!/bin/bash -l

set -x
set -o errexit

docker build --build-arg=VERSION=$1 -t ansible-unarchive-issue-repro$1 .
docker run --tty --user user ansible-unarchive-issue-repro$1
