### This script is used to delete a large number of topics.. 
### Usually for platform maintenance 
### or if a customer chooses to stop using Kafka and has a large number of topics to delete.
### Usage: Update the ZK URL with chroot if needed. 
### chmod +x bulk-delete-kafka-topics.sh; ./bulk-delete-kafka-topics.sh topics.txt
### Use with caution!
#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    kafka-topics --zookeeper <zk-url> --delete --topic "$line"
done < "$1"
