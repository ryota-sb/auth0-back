#!/bin/bash
set -e
rm -f /work/tmp/pids/server.pid
exec "$@"