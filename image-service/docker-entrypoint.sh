#!/bin/bash

set -e

if ! grep -q "image-service-test.local" /etc/hosts; then
  echo "$IMAGE_SERVICE_PORT_443_TCP_ADDR image-service-test.local.local"  >> /etc/hosts
fi

exec "$@"
