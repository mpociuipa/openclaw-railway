#!/bin/bash
set -e

export OPENCLAW_HOME=/app/.openclaw

mkdir -p "$OPENCLAW_HOME"

echo "Using OPENCLAW_HOME=$OPENCLAW_HOME"

if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "Installing default configuration..."

    cp /defaults/openclaw.json "$OPENCLAW_HOME/openclaw.json"
fi

mkdir -p "$OPENCLAW_HOME/workspace"
mkdir -p "$OPENCLAW_HOME/state"
mkdir -p "$OPENCLAW_HOME/logs"
mkdir -p "$OPENCLAW_HOME/agents"

echo "Starting OpenClaw Gateway..."

exec openclaw gateway run