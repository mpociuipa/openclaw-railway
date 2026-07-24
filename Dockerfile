FROM meistras/openclaw-custom:latest

COPY openclaw-backup /backup

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]