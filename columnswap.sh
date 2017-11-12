#!/bin/bash
# This script flips the first two columns in a given file.

awk ' { t = $i; $i = $j; $j = t; print; }' input_file

# To swap specified columns in file... Change i and j for differet columns

awk '{t=$i;$i=$j;$j=t;}1' i=2 j=3  input_file 
