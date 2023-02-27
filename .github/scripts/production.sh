#!/bin/bash
set -euox pipefail

for dir in tracks/ ; do
    cd $dir
    docker run -e INSTRUQT_TOKEN=${{ env.INSTRUQT_TOKEN }} --workdir="/track" --mount type=bind,source="$(pwd)",target=/track instruqt/cli track validate
done