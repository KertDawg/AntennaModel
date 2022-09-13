#  This script removes images with name <none> from Docker Desktop.



$StaleImages = docker images -f "dangling=true" -q

ForEach ($Image in $StaleImages)
{
    docker rmi $Image -f
}
