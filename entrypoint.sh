#!/bin/bash
set -e

echo "Starting OpenClaw..."

export OPENCLAW_HOME=/app/.openclaw

mkdir -p "$OPENCLAW_HOME"

echo "Checking OpenClaw files..."

if [ -z "$(ls -A $OPENCLAW_HOME 2>/dev/null)" ]; then
    echo "Restoring OpenClaw backup..."
    cp -a /tmp/openclaw-backup/. "$OPENCLAW_HOME/"
    echo "Backup restored"
else
    echo "Existing OpenClaw volume found. Skip restore."
fi


echo "Starting Gateway..."

exec openclaw gateway run \
 --bind auto \
 --allow-unconfigured \
 --port "${PORT:-18789}"