#!/bin/bash
for file in ./test/*
do
    if $file = 0
    then
    echo "$file SUCCESS"
    else
    echo "$file FAIL"
    fi
done

exit 0