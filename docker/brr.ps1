#  This will:
#  1. Stop and remove all running containers with this name.
#  2. Remove all old images with this name.
#  3. Build the image.
#  4. Run the image.


./RemoveContainers.ps1
./RemoveStaleImages.ps1
./Build.ps1
./Run.ps1

