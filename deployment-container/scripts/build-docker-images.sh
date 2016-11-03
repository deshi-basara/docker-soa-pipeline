#!/bin/bash

set -e

cd cache

echo "Building dispatcher-service..."
cd docker-soa-pipeline/dispatcher-service
if ! docker build -t dispatcher-service-image . >../dispatcher-service-build.log; then
  echo "Errors while building:"
  cat ../dispatcher-service-build.log
  exit 1
fi
cd ../..

echo "Building image-service..."
cd docker-soa-pipeline/image-service
if ! docker build -t image-service-image . >../image-service-build.log; then
  echo "Errors while building:"
  cat ../image-service-build.log
  exit 1
fi
cd ../..

echo "Building integration-tests..."
cd docker-soa-pipeline/integration-tests
if ! docker build -t integration-tests-image . >../integration-tests-build.log; then
  echo "Errors while building:"
  cat ../integration-tests-build.log
  exit 1
fi
cd ../..
