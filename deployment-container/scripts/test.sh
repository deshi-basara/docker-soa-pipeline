#!/bin/bash
set -e

echo "Run integration test"
docker run --rm --link dispatcher-service integration-tests
