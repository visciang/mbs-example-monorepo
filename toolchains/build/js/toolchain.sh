#!/bin/sh

set -e

mkdir -p .build

case $1 in
    lint)
        prettier --check . "!.{build,deps}/**/*" "!.mbs-*.json"
        ;;
    build)
        npm ci
        npm pack --pack-destination=.build/
        ;;
    *)
        echo "bad target: $1"
        exit 1
        ;;
esac
