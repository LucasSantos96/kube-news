FROM node:20.10.0-alpine3.18

RUN addgroup -S lucas && adduser -S lucas -G lucas

WORKDIR /app

COPY /src/package*.json ./

RUN npm install

COPY /src ./

RUN chown -R lucas:lucas /app

USER lucas

EXPOSE 8080

CMD ["node", "server.js"]