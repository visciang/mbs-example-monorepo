#!/bin/sh

set -e

case $1 in
    build)
        echo "Build on $ALPINE_VERSION"
        ;;
    *)
        echo "bad target: $1"
        exit 1
        ;;
esac