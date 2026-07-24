FROM meistras/openclaw-custom:latest

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
COPY openclaw-backup /tmp/openclaw-backup

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]