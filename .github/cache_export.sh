#!/bin/sh

set -e

MBS_VOLUMES=$(docker volume ls --format "{{ .Name}}" | grep -P "^mbs-")

for VOLUME in $MBS_VOLUMES; do
    echo "Exporting docker volume $VOLUME"

    mkdir -p $PWD/.cache

    docker run --rm -v $PWD/.cache:/dest -v $VOLUME:/volume alpine tar -cpf /dest/$VOLUME.tar volume
done

# sudo chmod -R +w .cache
USER_=$(id -u) GROUP_=$(id -g)
sudo chown -R $USER_:$GROUP_ .cache

# if cache size too big just wipe all for simplicity (no complex eviction policy).
# The next it will run clean (no cache) and then cache the latest packages.

CACHE_LIMIT="8000000000"
CACHE_UNCOMPRESSED_SIZE=$(du -bs .cache | cut -f 1)

ls -lh $PWD/.cache

if [ "$CACHE_UNCOMPRESSED_SIZE" -gt "$CACHE_LIMIT" ]; then
    echo "Over limit ($CACHE_UNCOMPRESSED_SIZE > $CACHE_LIMIT), wiping cache!"
    rm -rf .cache
fi
