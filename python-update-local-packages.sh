#!/bin/bash
pip3 freeze --local > requirements.txt
pip3 install -U requirements.txt
