#!/bin/bash
set -e

echo "Run integration test"
docker run --rm --link testsystem_dispatch-service_1 integration-tests-image
