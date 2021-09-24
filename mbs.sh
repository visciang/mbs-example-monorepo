#!/bin/sh

set -e

MBS_VERSION=0.3.2
BASEDIR=$(dirname "$0")
BASEDIR=$(readlink -f -- "$BASEDIR")

eval "$(docker run --init --rm --net=host --volume="$BASEDIR":"/mbs/run" --workdir="/mbs/run" visciang/mbs:$MBS_VERSION bootstrap)"
