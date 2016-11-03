#!/bin/bash

set -e

./pull-repositories.sh
./build-docker-images.sh
./start-containers.sh
./test.sh
./stop-containers.sh
