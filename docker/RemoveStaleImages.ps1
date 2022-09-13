#  This script removes old project images from Docker Desktop.


$StaleImages = docker images -q kertdawg/antenna-model

ForEach ($Image in $StaleImages)
{
    docker rmi $Image -f
}
