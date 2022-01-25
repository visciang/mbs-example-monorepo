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
    deps)
        rm -rf .mbs-deps/*/package/
        find .mbs-deps -name *.tgz -exec sh -c '
            echo "extracting dependency {}"
            tar xzf {} -C $(dirname {})
        ' \;
        ;;
    lint)
        prettier --check . "!.{build,mbs-deps,pnpm-store}/**/*" "!dist/**/*" "!.mbs-*.json" "!pnpm-lock.yaml"
        ;;
    build)
        CACHE_FROM=.mbs-deps/$MBS_ID-cache/cache.tgz
        if [ -f $CACHE_FROM ]; then
            echo "Using cached deps"
            tar xzf $CACHE_FROM
        fi

        pnpm install --frozen-lockfile
        pnpm build
        pnpm pack --pack-destination=.build/
        ;;
    *)
        echo "bad target: $1"
        exit 1
        ;;
esac
