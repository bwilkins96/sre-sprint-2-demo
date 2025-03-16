#!/bin/bash

# builds ubuntu docker image with rock, paper, scissors game and runs container

echo -e "BUILDING IMAGE: rps-image\n"

docker build -t rps-image .

echo -e "\nRUNNING CONTAINER: rps-container"
echo "Run 'play' to start playing"
echo -e "Run 'exit' to close the container\n"

docker run -it --name rps-container rps-image /bin/bash
