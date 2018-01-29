#!/bin/bash
### This simple script deletes all the subjects provided one per line in a text file. See Confluent's Schema Registry API Docs here: https://docs.confluent.io/current/schema-registry/docs/api.html
### Usage: chmod +x bulk-delete-confluent-schemas.sh; ./bulk-delete-confluent-schemas.sh subjects.txt (dev/np/prod)
### Schemas will be permanently deleted. Use with caution.
line=$1
sr=$2

case $sr in

	dev) address=
	;;
	np) address=
	;;
	prod) address=
	;;
esac

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo -e "Deleting subject $line in $sr environment."
  curl -XDELETE $address/subjects/$line
    echo -e "\n"
done < "$1"
