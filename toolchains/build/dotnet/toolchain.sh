#!/bin/sh

set -e

case $1 in
    lint)
        # todo
        ;;
    build)
        cd .mbs-deps
        rm -f *.nupkg
        find . -name *.nupkg -exec ln -s {} \;
        cd -

        dotnet build --configuration Release --source .mbs-deps/ --source https://api.nuget.org/v3/index.json
        ;;
    pack)
        dotnet pack --configuration Release -o bin/mbs
        ;;
    *)
        echo "bad target: $1"
        exit 1
        ;;
esac
