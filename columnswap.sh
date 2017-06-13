#!/bin/env bash
# This script flips the first two columns in a given file.

awk ' { t = $1; $1 = $2; $2 = t; print; }' input_file
