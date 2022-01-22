#!/bin/sh

set -e

mkdir -p .build

pnpm config set store-dir $PWD/.pnpm-store

case $1 in
    cache)
        rm -rf .cache && mkdir -p .cache

        pnpm install --frozen-lockfile

        tar czf cache.tgz .pnpm-store
        mv cache.tgz .cache
        ;;
    lint)
        prettier --check . "!.{build,mbs-deps,pnpm-store}/**/*" "!.mbs-*.json" "!pnpm-lock.yaml"
        ;;
    build)
        CACHE_FROM=.mbs-deps/$MBS_ID-cache/cache.tgz
        if [ -f $CACHE_FROM ]; then
            echo "Using cached deps"
            tar xzf $CACHE_FROM
        else
            pnpm install --frozen-lockfile
        fi

        pnpm build
        pnpm pack --pack-destination=.build/
        ;;
    *)
        echo "bad target: $1"
        exit 1
        ;;
esac
