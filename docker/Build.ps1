
$env:DOCKER_BUILDKIT=0
$env:COMPOSE_DOCKER_CLI_BUILD=0


#  Build the client.
cd ../client
quasar build
cd ..

#  Build the docker image.
docker build -t kertdawg/antenna-model .
