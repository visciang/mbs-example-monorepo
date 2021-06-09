#!/bin/sh

set -e

MBS_VOLUMES=$(docker volume ls --format "{{ .Name}}" | grep -P "^mbs-")

for VOLUME in $MBS_VOLUMES; do
    echo "Exporting docker volume $VOLUME"

    CACHE_DIR=$PWD/.cache/$VOLUME
    mkdir -p $CACHE_DIR

    docker run --rm -v $PWD/.cache/$VOLUME:/dest -v $VOLUME:/source alpine cp -rT /source /dest
done

sudo chown -R $(id -u):$(id -g) .cache

# if cache size too big just wipe all for simplicity (no complex eviction policy).
# The next it will run clean (no cache) and then cache the latest packages.

CACHE_LIMIT="8000000000"
CACHE_UNCOMPRESSED_SIZE=$(du -bs .cache | cut -f 1)

echo "Uncompressed cache size $CACHE_UNCOMPRESSED_SIZE"

if [ "$CACHE_UNCOMPRESSED_SIZE" -gt "$CACHE_LIMIT" ]; then
    echo "Over limit, wiping cache! (limit=$CACHE_LIMIT)"
    sudo rm -rf .cache
fi
