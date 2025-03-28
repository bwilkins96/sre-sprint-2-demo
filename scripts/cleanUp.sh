#!/bin/bash

# removes rock, paper, scissors container and image

echo -e "REMOVING CONTAINER: rps-container\n"

docker rm rps-container

echo -e "\nREMOVING IMAGE: rps-image\n"

docker rmi rps-image

echo -e "\nCLEARING BUILD CACHE\n"

docker buildx prune -f