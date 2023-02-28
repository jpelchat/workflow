#!/bin/bash

for dir in tracks/* ; do
    if [ -d "$dir" ]; then
        cd $dir && echo $dir IS BEING VALIDATED. && cd ../..
    fi
done