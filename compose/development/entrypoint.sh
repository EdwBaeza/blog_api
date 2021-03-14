#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /blogapi/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
echo "Entry point ....."

exec "$@"
