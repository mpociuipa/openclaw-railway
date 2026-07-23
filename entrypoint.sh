#!/bin/bash

set -e

echo "Starting OpenClaw..."

mkdir -p /app/.openclaw

if [ -f "/app/.openclaw/config.json" ]; then
    echo "Existing OpenClaw config found."
else
    echo "No config found."
fi


echo "Starting Gateway..."

openclaw gateway --bind 0.0.0.0