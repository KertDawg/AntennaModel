
$env:DOCKER_BUILDKIT=0
$env:COMPOSE_DOCKER_CLI_BUILD=0

docker build -t kertdawg/antenna-model .
