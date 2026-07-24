#!/bin/bash
set -e

export OPENCLAW_HOME=/app/.openclaw

mkdir -p "$OPENCLAW_HOME"

if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "No config found."
    echo "Copying default config..."
    cp /defaults/openclaw.json "$OPENCLAW_HOME/openclaw.json"
fi

exec openclaw gateway run