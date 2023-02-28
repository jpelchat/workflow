#!/bin/bash

for dir in tracks/ ; do
    if [ -d "$dir" ]; then
        cd $dir
        ls
        echo $dir IS BEING VALIDATED.
    fi
done