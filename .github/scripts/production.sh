#!/bin/bash
set -euxo pipefail

for dir in tracks/* ; do
    if [ -d "$dir" ]; then
        cd $dir
        docker run -e INSTRUQT_TOKEN=$TOKEN --workdir="/track" --mount type=bind,source="$(pwd)",target=/track instruqt/cli track validate
    fi
done

cd ~
ls

for dir in tracks/* ; do
    if [ -d "$dir" ]; then
        cd $dir
        docker run -e INSTRUQT_TOKEN=$TOKEN --workdir="/track" --mount type=bind,source="$(pwd)",target=/track instruqt/cli track push --force
        cd ..
    fi
done

cd ~

for dir in tracks/* ; do
    if [ -d "$dir" ]; then
        cd $dir
        docker run -e INSTRUQT_TOKEN=$TOKEN --workdir="/track" --mount type=bind,source="$(pwd)",target=/track instruqt/cli track test
        cd ..
    fi
done