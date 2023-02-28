#!/bin/bash

for dir in tracks/* ; do
    if [ -d "$dir" ]; then
        cd $dir
        ls
        echo $dir IS BEING VALIDATED.
        cd ..
    fi
done

for dir in tracks/* ; do
    if [ -d "$dir" ]; then
        cd $dir
        docker run -e INSTRUQT_TOKEN=$TOKEN --workdir="/track" --mount type=bind,source="$(pwd)",target=/track instruqt/cli track push --force
        cd ..
    fi
done

