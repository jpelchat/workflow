#!/bin/bash
set -euxo pipefail

for dir in tracks/* ; do
    if [ -d "$dir" ]; then
        cd $dir
        docker run -e INSTRUQT_TOKEN=${{ env.TOKEN }} --workdir="/track" --mount type=bind,source="$(pwd)",target=/track instruqt/cli track validate
    fi
done