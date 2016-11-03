FROM node:6

ENV NODE_ENV=docker

RUN mkdir /app
WORKDIR /app
COPY package.json /app/
RUN npm install

COPY . /app/
RUN npm run unit-tests
RUN npm run build

EXPOSE 8000

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["node", "dist/app.js"]
