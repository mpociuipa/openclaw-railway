#!/bin/bash
set -e

echo "Starting OpenClaw..."

export OPENCLAW_HOME=/root/.openclaw

mkdir -p $OPENCLAW_HOME


# Restore only if volume is empty
if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "Restoring OpenClaw backup..."

    cp -a /tmp/openclaw-backup/. $OPENCLAW_HOME/ || true

    echo "Backup restored"
else
    echo "Existing OpenClaw volume found. Skip restore."
fi


echo "Checking config..."

if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "Config missing, running setup..."

    openclaw setup --non-interactive || true
fi


echo "Starting Gateway..."

exec openclaw gateway run