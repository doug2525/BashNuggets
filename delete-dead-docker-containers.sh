#/bin/bash
docker ps -a | grep Exited | awk '{print $1}' > inactive-containers
while read -r line; do docker rm $line;echo "Deleted container $line"; done < inactive-containers 
