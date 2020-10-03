#!/bin/bash

for var in "$@"
do
    echo "go with $var"
    ./reset.sh "$var"
done


