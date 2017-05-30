#!/bin/bash
START=$(date +%s)
######### Put your script between #########

######### these comment lines #############
END=$(date +%s)
DIFF=$(( $END - $START ))
DIFF=$(( $DIFF / 60 ))
echo "The script took $DIFF minutes to run"
