#!/bin/bash

# removes rock, paper, scissors container and image

echo -e "\nREMOVING CONTAINER: rps-container\n"

docker rm rps-container

echo -e "\nREMOVING IMAGE: rps-image\n"

docker rmi rps-image