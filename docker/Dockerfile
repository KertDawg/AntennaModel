FROM debian:latest

WORKDIR /usr/src/app
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nodejs npm unzip net-tools procps
RUN npm i -g @quasar/cli concurrently nodemon

#  Install software.
RUN mkdir -p /opt
WORKDIR /opt
ARG CACHE_DATE=2016-01-01
ADD https://github.com/KertDawg/AntennaModel/archive/refs/heads/main.zip /opt/main.zip
RUN unzip main.zip
RUN mv /opt/AntennaModel-main /opt/AntennaModel

#  Build the client.
WORKDIR /opt/AntennaModel/client
RUN npm install
RUN quasar build

#  Build the server.
WORKDIR /opt/AntennaModel/server
RUN npm install

#  Expose the ports.
EXPOSE 3000 4000

#  Run the servers.
WORKDIR /opt/AntennaModel/server
ENTRYPOINT ["npm", "run", "server"]

