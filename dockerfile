FROM node:16-bullseye as build

RUN apt update; apt install -y git
RUN git clone https://github.com/spacebarchat/server.git
RUN mv server spacebar-server
WORKDIR /spacebar-server
RUN apt-get update ; apt-get upgrade -y ; apt-get install -y python-is-python3 build-essential
RUN npm i
RUN npm run setup

from node:16-alpine

COPY  --from=build /spacebar-server /spacebar-server
WORKDIR /spacebar-server
RUN apk add --update git ; npm install sqlite3 pg --save
CMD ["npm", "start"]
EXPOSE 3001/tcp
