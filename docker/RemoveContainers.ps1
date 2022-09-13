#  This script removes images with name <none> from Docker Desktop.



$Containers = docker ps -a -q --filter ancestor=kertdawg/antenna-model

ForEach ($Container in $Containers)
{
    $Stopped = docker stop $Container

    ForEach ($Remove in $Stopped)
    {
        docker rm $Remove
    }
}
