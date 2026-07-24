#!/bin/bash
set -e

echo "Starting OpenClaw..."

export OPENCLAW_HOME=/app/.openclaw

mkdir -p $OPENCLAW_HOME


if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "No config found"

    if [ -d "/tmp/openclaw-backup" ]; then
        echo "Restoring backup..."
        cp -a /tmp/openclaw-backup/. $OPENCLAW_HOME/
    fi
fi


if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "Creating minimal config..."

    cat > $OPENCLAW_HOME/openclaw.json <<EOF
{
  "gateway": {
    "mode": "local",
    "bind": "auto",
    "auth": {
      "token": "${OPENCLAW_GATEWAY_TOKEN}"
    }
  }
}
EOF

fi


echo "Starting Gateway..."

exec openclaw gateway run \
--allow-unconfigured \
--bind auto \
--port ${PORT:-8080}