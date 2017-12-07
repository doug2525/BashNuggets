#!/bin/bash
### This simple script deletes all the subjects provided one per line in a text file. See Confluent's Schema Registry API Docs here: https://docs.confluent.io/current/schema-registry/docs/api.html
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo -e "Deleting subject $line"
    curl -XDELETE <SR-URL>/subjects/$line
    echo -e "\n"
done < "$1"
