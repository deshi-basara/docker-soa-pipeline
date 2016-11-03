#!/bin/bash

set -e

if [ ! -S "/var/run/docker.sock" ]; then
  echo "Error: Docker socket file /var/run/docker.sock is missing!"
  exit 1
fi

if [ "$SSH_PASSPHRASE" == "" ]; then
  echo "Error: Environment variable SSH_PASSPHRASE not set!"
  exit 1
fi

# Sollte nur benutzt werden, falls tatsächlich ein valider Deployment-Key im Ordner liegt
#
#echo -n "SSH "
#eval $(ssh-agent -s)

#expect <<EOF
#  spawn ssh-add
#  expect "Enter passphrase"
#  send "$SSH_PASSPHRASE\r"
#  expect eof
#EOF

exec "$@"
