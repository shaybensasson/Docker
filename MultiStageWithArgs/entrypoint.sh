#!/bin/bash
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
