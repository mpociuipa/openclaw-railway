#!/bin/bash
set -e

export OPENCLAW_HOME=/app/.openclaw

echo "Starting OpenClaw..."

if [ ! -d "$OPENCLAW_HOME/credentials/whatsapp" ]; then

    echo "Restoring OpenClaw backup..."

    cp -a /backup/. "$OPENCLAW_HOME/"

fi


echo "Starting Gateway..."

exec openclaw gateway run