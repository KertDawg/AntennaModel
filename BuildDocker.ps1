#  This script will download the project (or update it if it's already here) 
#  and then build the Docker image.


#  Check the environment.

#  Is git installed and working?
Try { Get-Command git }
Catch
{
    Write-Host "git is not installed.  You'll need that." -ForegroundColor red -BackgroundColor white
    Exit
}

#  Is Docker installed?
Try { Get-Command docker }
Catch
{
    Write-Host "Docker is not installed.  You'll need that." -ForegroundColor red -BackgroundColor white
    Exit
}


#  What has already been downloaded?
If (Test-Path -Path ./AntennaModel)
{
    #  The repo exists down a folder.  Go there.
    Push-Location AntennaModel

    #  Update the code.  (I suppose this file won't update, but I'm OK with that.)
    git pull

    #  Go into the docker folder and build the image.
    Push-Location docker
    ./Build.ps1

    #  Go back where we started.
    Pop-Location
    Pop-Location
}
Else If (Test-Path -Path ./README.md -PathType Leaf)
{
    #  The repo exists in the current folder.

    #  Update the code.  (I suppose this file won't update, but I'm OK with that.)
    git pull

    #  Go into the docker folder and build the image.
    Push-Location docker
    ./Build.ps1

    #  Go back where we started.
    Pop-Location
}
Else
{
    #  The repo doesn't exist here.  Clone it.
    git clone https://github.com/KertDawg/AntennaModel.git

    #  The repo exists down a folder.  Go into the docker subfolder and build the image.
    Push-Location AntennaModel/docker
    ./Build.ps1

    #  Go back where we started.
    Pop-Location
}


