#!/bin/bash

set -e

if ! grep -q "dispatcher-service-test.local" /etc/hosts; then
  echo "$DISPATCHER_SERVICE_PORT_443_TCP_ADDR dispatcher-service-test.local" >> /etc/hosts
fi

exec "$@"
