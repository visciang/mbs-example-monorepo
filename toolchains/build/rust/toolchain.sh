#!/bin/sh

set -e

case $1 in
    lint)
        cargo fmt -- --check
        ;;
    build)
        cargo build --locked --release
        ;;
    test)
        cargo test --locked --release
        ;;
    *)
        echo "bad target: $1"
        exit 1
        ;;
esac
