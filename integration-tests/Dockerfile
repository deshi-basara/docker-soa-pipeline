FROM node:6

ENV NODE_ENV=docker

RUN mkdir /app
WORKDIR /app

COPY package.json /app/

RUN npm install

COPY . /app/

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["npm", "test"]
