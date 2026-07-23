#!/bin/bash
set -e

echo "Starting OpenClaw..."

export OPENCLAW_HOME=/app/.openclaw

# Jei config jau yra - onboarding nebedaromas
if [ ! -f "$OPENCLAW_HOME/openclaw.json" ]; then
    echo "First run: creating OpenClaw config..."

    openclaw onboard \
      --non-interactive \
      --accept-risk
else
    echo "Existing OpenClaw config found."
fi


echo "Starting Gateway..."

exec openclaw gateway run --bind 0.0.0.0