#!/bin/bash

set -ev

echo 'Hi4'
echo Your container args are: "$@"

echo =================================================

python my_script.py "$@"

echo =================================================

#python my_script.py "$@"
for var in "$@"
do
    echo "$var"
    # python my_script.py "$var"
done

currentDate=`date`
echo $currentDate > /docker-with-vols/from_docker.log

echo ""
cat /docker-with-vols/from_docker.log
