#!/bin/bash

# builds ubuntu docker image with rock, paper, scissors game and runs container

echo -e "\nBUILDING IMAGE: rps-image\n"

docker build -t rps-image .

echo -e "\nRUNNING CONTAINER: rps-container"
echo "Run 'play' to start playing"
echo -e "Run 'exit' to quit\n"

docker run -it --name rps-container rps-image /bin/bash
