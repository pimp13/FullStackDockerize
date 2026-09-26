FROM node:24.18.0-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev && npm cache clean --force

COPY . .

RUN addgroup -S app && adduser -S app -G app && chown -R app:app /app

USER app

EXPOSE 3001

CMD [ "node", "app.js" ]