FROM debian:latest

WORKDIR /usr/src/app
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nodejs npm
RUN npm i -g @quasar/cli

#  Install software.
RUN mkdir -p /opt/AntennaModel
WORKDIR /opt/AntennaModel
RUN git clone https://github.com/KertDawg/AntennaModel.git

#  Build the client.
WORKDIR /opt/AntennaModel/client
RUN npm install

#  Expose the ports.
EXPOSE 3000 8080

#  Run the servers.
CMD ["npm", "run", "serve"]
