#!/bin/bash
set -e

echo "Starting OpenClaw..."

export OPENCLAW_HOME=/app/.openclaw

mkdir -p $OPENCLAW_HOME

if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "First run: creating OpenCLAW config..."
    openclaw onboard --skip-health
fi


echo "Starting Gateway..."

exec openclaw gateway run --bind 0.0.0.0