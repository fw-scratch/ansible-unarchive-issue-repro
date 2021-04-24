#!/bin/bash -l

set -x
set -o errexit

docker build -t ansible-unarchive-issue-repro .
docker run --tty --user user ansible-unarchive-issue-repro
