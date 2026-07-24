#!/bin/bash
set -e

echo "Starting OpenClaw..."

export OPENCLAW_HOME=/app/.openclaw


# Restore only if volume is empty
if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "Restoring OpenClaw backup..."

    cp -a /tmp/openclaw-backup/. $OPENCLAW_HOME/

    echo "Backup restored"
else
    echo "Existing OpenClaw volume found. Skip restore."
fi


echo "Starting Gateway..."

exec openclaw gateway run