#!/bin/bash
### This simple script deletes all the subjects/versions provided one per line in a text file.
### To remove the schema an all versions just put the schema name in the text file.
### To remove only certain versions of the schema include the name and the versions you want to remove seperated by commas.
###  i.e. my.schema.name.json-value,1,2,3
### See Confluent's Schema Registry API Docs here: https://docs.confluent.io/current/schema-registry/docs/api.html
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
           env=Non-Prod
        ;;
        3) address=
           env=Prod
        ;;
esac

while IFS='' read -r line || [[ -n "$line" ]]; do
    name="$( cut -d ',' -f 1 <<< "$line" )";
    version="$( cut -d ',' -f 2- <<< "$line" )";

    if [ $name==$version ]; then
        echo -e "Deleting subject $name in $env."
        curl -XDELETE $address/subjects/$name;
    else
        for i in $(echo $version | sed "s/,/ /g")
        do
                echo -e "Deleting subject $name -  version $i in $env."
                curl -XDELETE $address/subjects/$name/versions/$i;
        done
    fi
    echo -e "\n"
done < "$1"
