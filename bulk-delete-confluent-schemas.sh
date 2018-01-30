#!/bin/bash
### This simple script deletes all the subjects provided one per line in a text file. See Confluent's Schema Registry API Docs here: https://docs.confluent.io/current/schema-registry/docs/api.html
### Update the script with each environment's schema registry api address in the address= variables
### Usage: chmod +x bulk-delete-confluent-schemas.sh; ./bulk-delete-confluent-schemas.sh subjects.txt where subjects.txt is the 
### 	   list of schema subjects to be deleted.
### Schemas will be permanently deleted. Use with caution.
line=$1

read -rp $'What environment?: \n1) Dev \n2) Non-Prod \n3) Prod\n' i
case $i in

	1) address=
	   env=Dev	
	;;
	2) address=
	   env=Non=Prod
	;;
	3) address=
	   env=Prod
	;;
esac

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo -e "Deleting subject $line in $env."
  curl -XDELETE $address/subjects/$line
    echo -e "\n"
done < "$1"
