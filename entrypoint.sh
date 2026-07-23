#!/bin/sh
set -e

echo "Starting OpenClaw Railway..."

if [ ! -f "/app/.openclaw/config.json" ]; then
    echo "Restoring OpenClaw data..."

    mkdir -p /app/.openclaw

    tar xzf /tmp/openclaw-data.tar.gz \
    -C /app/.openclaw
fi


echo "Starting Gateway..."

openclaw gateway