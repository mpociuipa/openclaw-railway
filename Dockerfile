FROM meistras/openclaw-custom:latest

ENV OPENCLAW_HOME=/app/.openclaw

COPY defaults /defaults
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]