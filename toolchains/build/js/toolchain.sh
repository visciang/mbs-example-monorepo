#!/bin/sh

set -e

mkdir -p .build

case $1 in
    cache)
        rm -rf .cache && mkdir -p .cache

        npm ci

        tar czf cache.tgz node_modules
        mv cache.tgz .cache
        ;;
    lint)
        prettier --check . "!.{build,deps}/**/*" "!.mbs-*.json"
        ;;
    build)
        CACHE_FROM=.deps/$MBS_ID-cache/cache.tgz
        if [ -f $CACHE_FROM ]; then
            echo "Using cached deps"
            tar xzf $CACHE_FROM
        else
            npm ci
        fi
        npm pack --pack-destination=.build/
        ;;
    *)
        echo "bad target: $1"
        exit 1
        ;;
esac
