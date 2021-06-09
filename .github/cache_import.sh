#!/bin/sh

set -e

for CACHE_DIR in .cache/*; do
    VOLUME=$(basename $CACHE_DIR)
    
    echo "Restoring docker volume $VOLUME"
    docker run --rm -v $PWD/$CACHE_DIR:/source -v $VOLUME:/dest alpine cp -rT /source /dest
done
