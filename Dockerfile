FROM meistras/openclaw-custom:latest

ENV OPENCLAW_HOME=/app/.openclaw

COPY openclaw-data.tar.gz /tmp/openclaw-data.tar.gz

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 18789