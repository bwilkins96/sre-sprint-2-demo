#!/bin/bash

# starts and stops docker container with rock, paper, scissors game written in bash

# must be run inside 'sre-sprint-2-demo' folder

# example commands:
# cd ./sre-sprint-2-demo
# ./main.sh

echo -e "\nRUNNING START SCRIPT\n"
./scripts/start.sh

echo -e "\nRUNNING CLEAN UP SCRIPT\n"
./scripts/cleanUp.sh
echo ""