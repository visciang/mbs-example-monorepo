#!/bin/sh

set -e

if [ "$(ls -A .cache/*.tar)" ]; then
    for VOLUME_TAR in .cache/*.tar; do
        VOLUME=$(basename -s .tar $VOLUME_TAR)
        
        echo "Restoring docker volume $VOLUME"
        docker run --rm -v $PWD/$VOLUME_TAR:/source/$VOLUME_TAR -v $VOLUME:/volume alpine tar -xpf /source/$VOLUME_TAR
    done
fi
