#!/bin/bash

# This script start all stopped containers on a given machine. 
# May need to be run multiple times if there are dependent containers like Kubernetes. 

docker start $(docker ps -a | awk '{print $1 }' | tail -n +2 | tr '\n' " ")
