
$env:DOCKER_BUILDKIT=0
$env:COMPOSE_DOCKER_CLI_BUILD=0


#  Does the repo exist?
If (Test-Path -Path ./README.md)
{
    git clone https://github.com/KertDawg/AntennaModel.git
}

#  Update the code.  (I suppose this file won't update, but I'm OK with that.)
git pull

#  Build the docker image.
docker build -t kertdawg/antenna-model .
