FROM node:22

RUN npm install -g openclaw

WORKDIR /app

COPY openclaw.json /root/.openclaw/openclaw.json

EXPOSE 18789

CMD ["openclaw","gateway","run","--bind","lan","--port","18789"]