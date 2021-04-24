#!/bin/bash -l

set -x
set -o errexit

id

ansible-playbook -vvvv /playbook.yml
ansible-playbook -vvvv /playbook.yml
