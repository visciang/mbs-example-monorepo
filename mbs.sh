#!/bin/sh

set -e

MBS_VERSION=0.2.1
BASEDIR=$(dirname "$0")
BASEDIR=$(readlink -f -- "$BASEDIR")

eval "$(docker run --init --rm --net host -v $BASEDIR:$BASEDIR -w $BASEDIR visciang/mbs:$MBS_VERSION bootstrap)"
