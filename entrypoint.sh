#!/bin/bash
set -e

echo "Starting OpenClaw..."

export OPENCLAW_HOME=/app/.openclaw

if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "Restoring OpenClaw backup..."

    mkdir -p "$OPENCLAW_HOME"
    cp -a /tmp/openclaw-backup/. "$OPENCLAW_HOME/"

    echo "Backup restored"
else
    echo "Existing OpenClaw volume found. Skip restore."
fi


echo "Starting Gateway..."

exec openclaw gateway run \
 --bind auto \
 --port "${PORT:-18789}" \
 --token "$OPENCLAW_GATEWAY_TOKEN"